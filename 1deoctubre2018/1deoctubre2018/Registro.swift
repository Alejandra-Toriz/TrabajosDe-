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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let nombreusuario = defaults.object(forKey: "nombreusuario")as? String{
            caja1.text = nombreusuario
        }else{
            caja1.text = ""
        }
       
    }
    func crealerta (mensaje:String)
    {
       
        var alert = UIAlertController(title: "Mensaje:", message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        let okalert = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action:UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
           
        })
        self.present(alert, animated: true)
        alert.addAction(okalert)
    }

    

        
    @IBAction func regis(_ sender: Any) {
        let username = caja1.text!;
        let password = caja2.text!;
        let confirm = caja3.text!;
        let defaults = UserDefaults.standard
        
        if(password == confirm)
        {
            crealerta(mensaje: "Tu usuario ha sido registrado")
        }
        if(password != confirm)
        {
        crealerta(mensaje:"Las contraseñas son diferentes");
        }else{
            let nuevoregistro = datos(nombre: caja1.text!, contraseña: caja2.text!)
            registracion.append(nuevoregistro)
        }
        
        
    }
}
    
    


