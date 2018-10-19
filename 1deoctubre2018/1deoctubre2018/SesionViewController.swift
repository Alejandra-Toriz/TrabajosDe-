//
//  SesionViewController.swift
//  1deoctubre2018
//
//  Created by MacBook on 19/10/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class SesionViewController: UIViewController {

    var fromFirstView : Int = 0
    var usuario = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usuario = fromFirstView
    }

    @IBAction func close(_ sender: UIButton) {
        
        print(ingresa)
        print(ingresa[usuario].sesion)
        
    }
    

}
