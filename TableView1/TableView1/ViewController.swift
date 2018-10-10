//
//  ViewController.swift
//  TableView1
//
//  Created by macbook on 29/08/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit
                                        //swift:desplego funciones                       //objetive c
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var alumnos = ["Alejandra", "Andrea", "Emmanuel", "Luis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //qué table view escojo, y que numero de seccion, por default una seccion, debo indicar cuantos renglones quiero
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //el numero de celdas debe ser exacto al de los datos, o truena
        //NO hacer 9000 celdas de golpe, gasta memoria, entonces se reutilizan,
        //contenidos:  accesorio:
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for:  indexPath)
        
        cell.textLabel?.text = alumnos[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Usted seleciono el renglon: \(alumnos[indexPath.row])")
    }
    
}

