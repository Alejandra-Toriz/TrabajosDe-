//
//  ViewController.swift
//  22Ago
//
//  Created by macbook on 22/08/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //toda vbista tiene un contrrolador
                                        //touch
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
                            //en la vista donde estpy
        //dump(sender.location(in: view)) // checa donde estoy haciendo click en ... imagen, vista, etc
        //dump da mas info que print
        //devuelve las coor en una tupla
        
        let x = sender.location(in: view).x
        let y = sender.location(in: view).y
        //valor max = 1 min = 0
        view.backgroundColor = UIColor(red: x/400, green: y/400, blue: (x - y)/400, alpha: 1.0)
        //varia en espectros de azul por el 1.0 en el; alpha es el nivel de trasparencia
        
        
        //tap view controler: seccionado
        //table view controler: tabla que no se puede modificar
        
        /*
        let vista = SecondVeiwControlerViewController()
        present(vista, animated: true, completion: nill)
        //presenta a lo bruto
 */
    }
    

}

