//
//  ViewController.swift
//  IMAGEview
//
//  Created by macbook on 03/10/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //redondear imagenes:
        imagen.image = UIImage(named: "perritou")
        imagen.layer.cornerRadius = 50
        imagen.layer.borderColor = UIColor.blue.cgColor
        imagen.layer.borderWidth = 3
        imagen.layer.masksToBounds = true
    }



}

