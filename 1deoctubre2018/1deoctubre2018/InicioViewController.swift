//
//  InicioViewController.swift
//  1deoctubre2018
//
//  Created by MacBook on 19/10/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class InicioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ingresar(_ sender: UIButton) {
        for i in ingresa{
            if i.sesion == true{
                print("hola de nuevo")
                //aqui agregaras el codico para inicio
            }
        }
        print("sesion abierta")
    }
}
