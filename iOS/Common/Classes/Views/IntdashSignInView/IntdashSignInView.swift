//
//  IntdashSignInView.swift
//
//  Created by Ueno Masamitsu on 2020/09/15.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import AuthenticationServices

fileprivate let kInputTextFieldTitleLabelOffset: CGFloat = 26

protocol IntdashSignInViewDelegate: NSObjectProtocol {
    func didStartFetchToken(_ view: IntdashSignInView)
    func didFinishFetchToken(_ view: IntdashSignInView, result: Bool, error: Error?)
}

class IntdashSignInView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!    
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
        
    @IBOutlet weak var signInBtn: UIButton!
    
    private var webAuthSession: NSObject?
    
    weak var delegate: IntdashSignInViewDelegate?
    
    var callbackURLScheme: String = ""
    
    var signInUserName: String = ""
    var signInUserID: String = ""
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init coder - IntdashSignInView")
        _init()
    }
    
    private func _init() {
        Bundle.main.loadNibNamed("IntdashSignInView", owner: self, options: nil)
        self.contentView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(self.contentView)
        self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.layoutIfNeeded()
        
        self.appNameLabel.text = Bundle.main.infoDictionary![kCFBundleNameKey as String] as? String
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            self.versionLabel.text = "version \(version)"
        } else {
            self.versionLabel.text = ""
        }
        
        self.signInBtn.addTarget(self, action: #selector(signInBtnPushed(_:)), for: .touchUpInside)
        
        IntdashAPIManager.shared.delegate = self
    }
    
    @IBAction func signInBtnPushed(_ sender: Any) {
        print("signInBtnPushed")
        self.startFetch()
        let api = IntdashAPIManager.shared
        DispatchQueue.global().async {
            api.generateOAuth2AuthorizationURL(callbackURLScheme: self.callbackURLScheme) { [weak self] (url, codeVerifier, state, error) in
                guard error == nil, let url = url, let authURL = URL(string: url), let codeVerifier = codeVerifier else {
                    print("generateAuthorizationURL failed. \(error?.localizedDescription ?? "")")
                    self?.signInFailed(error)
                    return
                }
                DispatchQueue.main.async {
                    let callbackURLScheme = self!.callbackURLScheme.replacingOccurrences(of: ":", with: "%3A").replacingOccurrences(of: "/", with: "%2F") // URLエンコード
                    let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: callbackURLScheme) { [weak self] (callbackURL, error) in
                        guard error == nil, let callbackURL = callbackURL else {
                            print("Web authentication callback error. \(error?.localizedDescription ?? "")")
                            self?.signInFailed(error)
                            return
                        }
                        var result = false
                        var code: String?
                        if let queryItems = URLComponents(string: callbackURL.absoluteString)?.queryItems {
                            for item in queryItems {
                                print("[\(item.name)] => \(item.value ?? "NULL")")
                                if item.name == "state", item.value == state {
                                    result = true
                                }
                                if item.name == "code" {
                                    code = item.value
                                }
                            }
                        }
                        if let code = code, result {
                            print("Web authentication was successful.")
                            api.requestAccessToken(code: code, codeVerifier: codeVerifier, callbackURLScheme: callbackURLScheme) { [weak self] (_, error) in
                                guard error == nil else {
                                    print("requestAccessToken failed: \(error!.localizedDescription)")
                                    self?.signInFailed(error)
                                    return
                                }
                                api.requestMeInfo { [weak self] (response, error) in
                                    guard let response = response else {
                                        print("requestEdgesMe failed: \(error?.localizedDescription ?? "")")
                                        self?.signInFailed(error)
                                        return
                                    }
                                    print("Successful sign-in. \(response.name)[ \(response.uuid) ]")
                                    self?.signInSuccess()
                                }
                            }
                        } else {
                            print("Web authentication failed.")
                            self?.signInFailed(nil)
                        }
                    }
                    if #available(iOS 13.0, *) {
                        session.presentationContextProvider = self
                        session.prefersEphemeralWebBrowserSession = false
                    }
                    // Start
                    self?.webAuthSession = session
                    session.start()
                }
            }
        }
    }
    
    func startFetch() {
        self.delegate?.didStartFetchToken(self)
        DispatchQueue.main.async {
            self.isUserInteractionEnabled = false
        }
    }
    
    func signInFailed(_ error: Error?) {
        self.delegate?.didFinishFetchToken(self, result: false, error: nil)
        DispatchQueue.main.async {
            self.isUserInteractionEnabled = true
        }
    }
    
    func signInSuccess() {
        self.delegate?.didFinishFetchToken(self, result: true, error: nil)
        DispatchQueue.main.async {
            self.isUserInteractionEnabled = true
        }
    }
}

extension IntdashSignInView: ASWebAuthenticationPresentationContextProviding {
    
    @available(iOS 12.0, *)
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first ?? ASPresentationAnchor()
    }
    
}

extension IntdashSignInView: IntdashAPIManagerDelegate {
    
    func didStartRefreshAccessToken(_ manager: IntdashAPIManager) {
        print("didStartRefreshAccessToken - IntdashAPIManagerDelegate")
        self.delegate?.didStartFetchToken(self)
    }
    
    func didFinishRefreshAccessToken(_ manager: IntdashAPIManager, result: Bool, error: Error?) {
        print("didFinishRefreshAccessToken result: \(result) - IntdashV2APIManagerDelegate")
        guard result else {
            self.delegate?.didFinishFetchToken(self, result: false, error: error)
            return
        }
        print("requestMeInfo")
        IntdashAPIManager.shared.requestMeInfo { [weak self] (response, error) in
            guard let response = response else {
                print("requestMeInfo failed: \(error?.localizedDescription ?? "")")
                self?.delegate?.didFinishFetchToken(self!, result: false, error: error)
                return
            }
            print("Successfully refresh access token. \(response.name)[ \(response.uuid) ]")
            self?.signInUserName = response.name
            self?.signInUserID = response.uuid
            self?.delegate?.didFinishFetchToken(self!, result: true, error: error)
        }
    }
}
