//
//  Registro.swift
//  1deoctubre2018
//
//  Created by macbook on 08/10/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class Registro: UIViewController {
    @IBOutlet weak var caja1: UITextField!
    @IBOutlet weak var caja2: UITextField!
    @IBOutlet weak var caja3: UITextField!
    
    var datos1: [Data] = []
    var newUser = Datos(nombre: "", usuario: "", contraseña: "")


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defautls = UserDefaults.standard
        
        datos = defautls.object(forKey: "datos") as? [Datos] ?? [Datos]()
        
        print(datos.count)
        for cadena in datos{
            print(cadena)
        }
        
    }
    
    func crealerta ()
    {
        
        let  alert = UIAlertController(title: "Tu usuario ha sido registrado", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action:UIAlertAction) in
            print ("buuu")
        }))
        self.present(alert, animated: true)
        
    }

    @IBAction func registrar(_ sender: UIButton) {
        print("aqui")
        let defautls = UserDefaults.standard
        
        if let dato = caja1.text, let dato1 = caja2.text, let dato2 = caja3.text {
            print("o aqui")
            newUser.nombre = dato
            newUser.usuario = dato1
            newUser.contraseña = dato2
            datos.append(newUser)
            defautls.set(datos, forKey: "datos")
            
        }
        print(newUser)
        print(datos)
    }
    
}
