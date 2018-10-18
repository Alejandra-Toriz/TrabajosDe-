//
//  ViewController.swift
//  mapitas02
//
//  Created by macbook on 10/10/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//Ageregar MKMapViewDelegate
// todo lo que esta dentro es self
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    let locationManager = CLLocationManager()
    let location = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapa.delegate = self
        //Hay que delegar al coreLocation
        locationManager.delegate = self
        
        //Va a solicitar permiso
        //Para que me de permiso: infoplist, todo relacionado con permisos que tengan que ver con información del usuario
        //ultimo renglon y +, elegir uno, choro mareador, revisar que devemos agregar en consola
        
        locationManager.requestAlwaysAuthorization()
        
                    //Qué tan exacta quiero la ubicasión
        //kCLLocationAccuracyBest: lo mejor que tengas
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //NO me dará datos hasta que me mueva
        // kCLDistanceFilterNone: no filtramos nada ahorita
        locationManager.distanceFilter = kCLDistanceFilterNone
        
        //Actualizar el GPS
        locationManager.stopUpdatingLocation()
        
        //bulleano que indica donde esta el usuario
        mapa.showsUserLocation = true
        
        //Cooor fac: 19.3275, -99.1824
        //si permisos fallan, borrar app del simulador, prsionar hasta que bailen
        
    }


    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: mapa.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009))
        
        mapa.setRegion(region, animated: true)
    }
    
    //delegado de core Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(location)
    }
}
