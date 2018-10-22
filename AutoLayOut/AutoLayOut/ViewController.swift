//
//  ViewController.swift
//  AutoLayOut
//
//  Created by macbook on 19/09/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Forma programatica de centrar el programa
    var etiqueta: UILabel = {
        
        let lb = UILabel()
        lb.text = "Label"
        lb.font = UIFont(name: "Arial", size: 40.0)
        lb.translatesAutoresizingMaskIntoConstraints = false //habilita constraite
        return lb
    }()
    
    var boton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Click Me", for: .normal)
        bt.backgroundColor = UIColor.blue
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(etiqueta)
        view.addSubview(boton)
        //activarlos o no funciona
        etiqueta.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        etiqueta.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        boton.topAnchor.constraint(equalTo: etiqueta.bottomAnchor, constant: 20).isActive = true
        boton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    //En swift no hay variables globales, encapsumaliento, puedo acceder a las propiedades por metodos, pero no puedo compartierlos
    //las panatllas en un iphone soon puntos no oixeles, auto lay out centra solito
    //cuidado con mover ob que siirvan de refenrencia
    
}

