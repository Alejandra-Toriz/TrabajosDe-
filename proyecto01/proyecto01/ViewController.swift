//
//  ViewController.swift
//  proyecto01
//
//  Created by macbook on 15/08/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var gato: UIImageView!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderMove(_ sender: UISlider) {
    
    var valor = slider.value
    
    if(valor < 0.3){
        gato.image = UImage(named: "gato1")
    }else if valor < 0.3 && valor < 0.6{
        gato.image = UImage(named: "gato2")
    }else{
        gato.image = UImage(named: "gato3")
    }
    }
}

