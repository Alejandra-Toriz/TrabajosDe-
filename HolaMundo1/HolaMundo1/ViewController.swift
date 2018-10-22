//
//  ViewController.swift
//  HolaMundo1
//
//  Created by macbook on 15/08/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //etqueta para cambiar propiedades de hola muno, ctrl arratro la etiqueta
    
    @IBOutlet weak var etu: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    var clics = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                                        // punto . color
        view.backgroundColor = UIColor.cyan
        
        etu.text = " Gato"
        
    }

    @IBAction func click(_ sender: UIButton) {
        clics += 1
        etu.text = "Hola\(clics)"
        
        print(slider.value)
    }
    
    @IBAction func sliderMove(_ sender: UISlider) {
        
        print(slider.value)
        view.backgroundColor = UIColor(red: CGFloat (slider.value), green: <#T##CGFloat#>(slider.value), blue: <#T##CGFloat#>(slider.value), alpha:1.0)
        
    }
    
 
}

