//
//  ViewController.swift
//  CadenaEjem
//
//  Created by macbook on 01/10/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lista : [String] = []
    
    @IBOutlet weak var Caja: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        print("inicio")
        lista = defaults.object(forKey: "lista") as? [String] ?? [String]()
        
        print(lista.count)
        for cadena in lista{
            print(cadena)
        }
        
    }
    
/* Tres formas de guardar información:
    1) base de datos
    2) user dafaults
    3) creacion de un archivo
 */

    @IBAction func guardar(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        if let dato = Caja.text{
            lista.append(dato)
            defaults.set(lista, forKey: "lista")
        }
    }
    
}

