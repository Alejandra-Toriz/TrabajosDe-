//
//  botoncito.swift
//  boton
//
//  Created by macbook on 12/09/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

class botoncito: UIButton {

    //cuando el bot aparezaca en viata se llama esta funcion, controla ta
    override func awakeFromNib() {
        layer.borderWidth = 3.0 //bordes
        layer.borderColor = UIColor.black.cgColor
        //layer.frame = CGRect(x: 0, y: 0, width: 300, height: 300) controla los botones conectados
        //layer.frame.width = CGFloat(300) no los acepto
        //layer.frame.height = CGFloat(300)
        layer.cornerRadius = 9
        //animaciones
        
        /*
        //spring animation
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.8
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
                        //marca
        layer.add(pulse, forKey: nil)
        //al layer del boton agregale la funsiòn pulse
        */
        
        let flash = CABasicAnimation(keyPath: "opacity") // o opaco 1 brillo
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let frontPoint = CGPoint(x: center.x - 5, y: center.y)
        let frontValue = NSValue(cgPoint: frontPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = frontValue
        shake.toValue = toValue
        
        layer.add(flash, forKey: nil)
        layer.add(shake, forKey: nil)
        
        
    }

}
