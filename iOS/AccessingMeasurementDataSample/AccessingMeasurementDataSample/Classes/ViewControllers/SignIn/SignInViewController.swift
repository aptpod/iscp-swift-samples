//
//  SignInViewController.swift
//  AccessingMeasurementDataSample
//
//  Created by Ueno Masamitsu on 2020/09/11.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//
import UIKit

class SignInViewController: UIViewController, IntdashSignInViewDelegate {
    
    // App Delegate
    let app: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var signInView: IntdashSignInView!
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad() - SignInViewController")
        self.signInView.callbackURLScheme = Config.CALLBACK_URL_SCHEME
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear() - SignInViewController")
        self.signInView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear() - SignInViewController")
        self.signInView.delegate = nil
    }
    
    deinit {
        print("deinit - SignInViewController")
    }
    
    //MARK: - View Transitions
    
    func goToNextView() {
        DispatchQueue.main.async {
           if let vc = self.storyboard?.instantiateViewController(withIdentifier: SelectEdgeViewController.VIEW_IDENTIFIER) {
                let nc = UINavigationController(rootViewController: vc)
                nc.navigationBar.barStyle = self.navigationController!.navigationBar.barStyle
                nc.modalPresentationStyle = .fullScreen
                self.navigationController?.present(nc, animated: true, completion: nil)
           }
        }
    }
    
    //MARK: - Loading Dialog
    var loadingDialog: LoadingAlertDialogView?
    func startLoading() {
        guard self.loadingDialog == nil else { return }
        DispatchQueue.main.async {
            self.loadingDialog = LoadingAlertDialogView.init(addView: self.app.window!, showMessageLabel: false)
            self.loadingDialog?.startAnimating()
        }
    }
    func stopLoading() {
        guard self.loadingDialog != nil else { return }
        DispatchQueue.main.async {
            self.loadingDialog?.stopAnimating()
            self.loadingDialog = nil
        }
    }

    //MARK: - IntdashSignInViewDelegate
    func didStartFetchToken(_ view: IntdashSignInView) {
        self.startLoading()
    }
    
    func didFinishFetchToken(_ view: IntdashSignInView, result: Bool, error: Error?) {
        print("didFinishFetchToken(result: \(result), error: \(error?.localizedDescription ?? "nil")) - IntdashSignInViewDelegate")
        self.stopLoading()
        guard result else { return }
        self.app.signInUserName = view.signInUserName
        self.app.signInUserID = view.signInUserID
        self.goToNextView()
    }
}
