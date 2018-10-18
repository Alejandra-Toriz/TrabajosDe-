//
//  ViewController.swift
//  1deoctubre2018
//
//  Created by macbook on 01/10/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var user: UITextField!
    
    //var datos: [Datos] = []
    var usuario: String = ""
    var contraseña: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defautls = UserDefaults.standard
        
        datos = defautls.object(forKey: "datos") as? [Datos] ?? [Datos]()
    }

    @IBAction func ingresar(_ sender: UIButton) {
        print("minimo estoy entrando")
        for i in datos{
            print(i.usuario)
            if i.usuario == user.text{
                print("Oye si estas compa!!!")
                if i.contraseña == password.text{
                    print("Y además tu contraseña es correcta")
                }
                //aqui falta comando para ir a otra vista
            }
            else{
                print("pos no estas compa")
            }
        }
    }
}

