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
            
            //de todos los tecfiel que tengas mandame el primero
            if let textField = alertVC.textFields?.first {
            //! aseguro que hay algo
                
                //Esto cuando se usa el ultimo parametro en una funsión, si no, no lo haga compa
                self.reverseGeocode(address: textField.text!){placemark in
                    //punto de inicio
                    let startingMapItem = MKMapItem.forCurrentLocation()
                                            //localización del usuario
                    
                    //guardo el destino: creo un lugar, y le pido sus coordenadas
                    let destinationPlacemark = MKPlacemark(coordinate: (placemark.location?.coordinate)! )//2D latitud y longitud
                    
                    //para colocar una banderita visual en el mapa uso la variable anterior y sus coordenadas
                    let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
                    
                    let directionsRequest = MKDirectionsRequest()
                    
                    directionsRequest.transportType = .automobile //dice paso a paso por dónde irme
                    directionsRequest.source = startingMapItem //origen
                    directionsRequest.destination = destinationMapItem //destino
                    
                    //optengo las direcciones
                    //dame una instrucción: directionsRequest tiene cómo de donde hasta donde
                    let directions = MKDirections(request: directionsRequest)
                    
                    //recive clousure: te regreso algo y una error
                    directions.calculate(completionHandler: { ( response, error) in
                        if let error = error{
                            print(error.localizedDescription)
                            return
                        }
                        
                        print(response?.routes.count)
                        //dame la respuesta y del conjunto de rutas la primera
                        guard let response = response, let route = response.routes.first else{
                            return
                        }
                        //si no esta vacio
                        if !route.steps.isEmpty{
                            for step in route.steps{
                                print(step.instructions)
                            }
                        }
                    })
                    
                    
                    //abre los mapas de iOS con un arreglo de items
                    MKMapItem.openMaps(with: [destinationMapItem], launchOptions: nil)// nil: qué quieres que haga el item cuando aparezca
                }
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    //Se agrega un cluosure: para no perder control de aplicasion, la app abre la ubicasión pero senregresa
    //No regresa nada
    func reverseGeocode(address: String, completion: @escaping (CLPlacemark) -> ()){
        
        let geocoder = CLGeocoder()
        //recive una direccion y un cluosure, el cual implementara aqui, r4egresa: placemarks: arreglo de lugares que encontró con esa referencia; si no encuentra nada regresa error
        geocoder.geocodeAddressString(address){ (placemarks, error) in
            
            if let error = error{
                print(error.localizedDescription)
                return
            }
            //guard anti if
            // del arreglo dame la primera opcion en una variable del tipo placemark
            guard let placemarks = placemarks, let placemark = placemarks.first else {
                return
            }
            
            completion(placemark)
            //ERROR clouse use of non- escaping parameter.... darle fix para agregar un scaping: vete a ejecutar closure, ya regresaste , qué pasó?, se lo dice al usuario
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        
        mapView.setRegion(region, animated: true)
    }
    

}


