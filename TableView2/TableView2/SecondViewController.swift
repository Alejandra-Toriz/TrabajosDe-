//
//  SecondViewController.swift
//  TableView2
//
//  Created by macbook on 10/09/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var etiqueta: UILabel!
    var frontFirstViewController: String = "" //para que no haya problema con los neels
    
    override func viewDidLoad() {//ya se aoarecio?
        super.viewDidLoad()//pintala
        etiqueta.text = frontFirstViewController //asignale lo que venga de la 1ra vista
        // Do any additional setup after loading the view.
    }

}
