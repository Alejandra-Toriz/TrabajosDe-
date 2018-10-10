//
//  SecondVeiwControlerViewController.swift
//  22Ago
//
//  Created by macbook on 22/08/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit
//mi clase herada (metodos y objetos) de UIViewContrller
class SecondVeiwControlerViewController: UIViewController {
    //yo heredo de mi padre, pero no soy el
    override func viewDidLoad() {
        super.viewDidLoad()
        //cambia el color al ponerla
        view.backgroundColor = UIColor.red
        
        // Do any additional setup after loading the view.
    
    
    }
    //1ra forma
    @IBAction func Boton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
     //sensa si estas autorizado o no
    }
    
}
/*table view controller: tabla no modificable
 tap view controller: vista dividida en celdas
 
 para cambiar de vista principal cambiamos la flechita
 no escribir nada en la advertencia de memoria
 enlazar la viata con el programa en: show the identity inspecto al principio si y solo si
 quiero enlazar una accion
 
 con el editor_>snapg guides-> navegate controller, permite regresar
 
 dismiss metodo llamado present, en este caso se hizo de porma indirecta, el aparace una vista
 de la vista donde quiero que se valla dismiss, no usarlo si estor en el controlador
 
 
*/
