//
//  MainViewController+MapView.swift
//  SensorGPSDownstreamApp
//
//  Created by Ueno Masamitsu on 2020/09/23.
//  Copyright © 2020 aptpod, Inc. All rights reserved.
//

import UIKit
import MapKit

extension MainViewController: MKMapViewDelegate {
    
    func setupMapView() {
        self.mapView.delegate = self
        self.isUserTracking = true
        self.didUpdateUserTrackingFlag()
        self.mapViewInfoBtn.addTarget(self, action: #selector(mapViewInfoBtnPushed(_:)), for: .touchUpInside)
    }
    
    @IBAction func mapViewInfoBtnPushed(_ sender: Any) {
        self.isUserTracking = !self.isUserTracking
        print("mapViewInfoBtnPushed isUserTracking: \(self.isUserTracking)")
        if self.isUserTracking, self.userAnnotation != nil {
            let camera = self.mapView.camera
            if let head = self.lastHeading {
                let camera = self.mapView.camera
                camera.heading = head.data
            }
            if let coordinate = self.lastCoordinate {
                camera.centerCoordinate = CLLocationCoordinate2D(latitude: coordinate.x, longitude: coordinate.y)
            }
            self.mapView.setCamera(camera, animated: true)
        }
    }
    
    func didUpdateUserTrackingFlag() {
        DispatchQueue.main.async {
            if !self.isUserTracking {
                self.mapViewInfoBtn.tintColor = Config.MAP_VIEW_INFO_BTN_DEFAULT_COLOR
                self.mapViewInfoBtn.backgroundColor = Config.MAP_VIEW_INFO_BTN_DEFAULT_BG_COLOR
            } else {
                self.mapViewInfoBtn.tintColor = Config.MAP_VIEW_INFO_BTN_SELECTED_COLOR
                self.mapViewInfoBtn.backgroundColor = Config.MAP_VIEW_INFO_BTN_SELECTED_BG_COLOR
            }
        }
    }
    
    func setCoordinate(_ coordinate: Vector2DPayload) {
        print("setCoordinate(latitude: \(coordinate.x), longitude: \(coordinate.y))")
        self.lastCoordinate = coordinate
        let coordinate = CLLocationCoordinate2D(latitude: coordinate.x, longitude: coordinate.y)
        if self.userAnnotation == nil {
            self.isUserTracking = true
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = self.app.targetEdge?.name
            self.userAnnotation = annotation
            DispatchQueue.main.async {
                self.mapView.addAnnotation(annotation)
                
                guard self.isUserTracking else { return }
                let camera = self.mapView.camera
                if #available(iOS 13.0, *) {
                    camera.centerCoordinateDistance = Config.MAP_VIEW_USER_MARKER_CAMERA_DEFAULT_DISTANCE
                } else {
                    camera.altitude = Config.MAP_VIEW_USER_MARKER_CAMERA_DEFAULT_DISTANCE
                }
                camera.centerCoordinate = coordinate
                self.mapView.setCamera(camera, animated: true)
            }
        } else {
            self.userAnnotation?.coordinate = coordinate
            guard self.isUserTracking else { return }
            let camera = self.mapView.camera
            camera.centerCoordinate = coordinate
            self.mapView.setCamera(camera, animated: true)
        }
    }
    
    func setTrueHeading(_ heading: Float64Payload) {
        print("setTrueHeading(trueHeading: \(heading))")
        self.lastHeading = heading
        let heading = heading.data
        guard self.userAnnotation != nil, self.isUserTracking else { return }
        DispatchQueue.main.async {
            let camera = self.mapView.camera
            camera.heading = heading
            self.mapView.setCamera(camera, animated: true)
        }
    }
    
    //MARK:- MKMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
        if let markerAnnotationView = annotationView as? MKMarkerAnnotationView {
            markerAnnotationView.glyphTintColor = Config.MAP_VIEW_USER_MARKER_BALLOON_TEXT_TINT_COLOR
            markerAnnotationView.glyphText = Config.MAP_VIEW_USER_MARKER_BALLOON_TEXT
            markerAnnotationView.markerTintColor = Config.MAP_VIEW_USER_MARKER_BALLOON_TINT_COLOR
        }
        return annotationView
    }
}
