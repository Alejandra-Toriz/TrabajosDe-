//
//  Generico.swift
//  LiveViews
//
//  Created by macbook on 03/10/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

@IBDesignable
class Generico: UIView {
    @IBInspectable var colorFondo : CGColor = UIColor.blue.cgColor
    
    @IBInspectable var largo : CGFloat = 100
    // FUNCIONES PAR CUANDO SE REFRESCA UNA VISTA:
 
    override func awakeFromNib(){
        print("Awake")
        layer.backgroundColor = colorFondo
    }

    /*override func draw(_ rect: CGRect){
        
    }*/
}
