//
//  ViewController.swift
//  hello-maps
//
//  Created by Mohammad Azam on 8/5/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//lo que hace el navegation controller es agregar una barra para implementar el boton
//action sheet sale una ventana desde abajo para elejir que cosa quiero hacer o por que metodo
//allert controller, da dos allert acction

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView :MKMapView!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
    }
    
    @IBAction func showAddAddressView() {
        
        let alertVC = UIAlertController(title: "Add Address", message: nil, preferredStyle: .alert)
        
        alertVC.addTextField { textField in
            
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
            
            if let textField = alertVC.textFields?.first {
                
                // reverse geocode the address
                self.reverseGeocode(address: textField.text!)
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func reverseGeocode (address: String){
        
        let geoCoder = CLGeocoder()
        
        //le pasa una direccion y me devuelve, si hay erro contesta con el error, si no me da los lugares que encontró
        geoCoder.geocodeAddressString(address){
            placemarks, Error in
            
            if let Error = Error{
                print(Error.localizedDescription)
                return
            }
            guard let placemarks = placemarks, let placemark = placemarks.first else{
                return}
            
            self.addPlacemarkToMap(placemark: placemark)
        }
        
    }
    //Geofencive alenta respecto a la u
    func addPlacemarkToMap(placemark: CLPlacemark){
        let coordinate = placemark.location?.coordinate
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate!
        self.mapView.addAnnotation(annotation)
        
        self.mapView.add(MKCircle(center: annotation.coordinate, radius: 200))
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer{
        if overlay is MKCircle{
            var circleRenderer = MKCircleRenderer(circle: overlay as! MKCircle)
            circleRenderer.lineWidth = 3.0
            circleRenderer.strokeColor = UIColor.purple
            circleRenderer.fillColor = UIColor.purple
            circleRenderer.alpha = 0.4
            return circleRenderer
        }
        return MKOverlayRenderer()
    }
    func mapView(_ mapView: MKMapView,didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        
        mapView.setRegion(region, animated: true)
    }
    

}

