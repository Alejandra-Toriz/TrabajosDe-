//
//  ViewController.swift
//  mapitas
//
//  Created by macbook on 08/10/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit
import MapKit

//Siempre llamarlo mapita o nunca MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapKit: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapKit.delegate = self

        
        
    }

    
    
}

