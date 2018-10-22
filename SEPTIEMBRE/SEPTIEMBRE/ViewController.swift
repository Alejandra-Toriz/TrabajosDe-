//
//  ViewController.swift
//  SEPTIEMBRE
//
//  Created by macbook on 03/09/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit
                                        //protocolo que sirve para desplegar datos en la table view
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tablita: UITableView!
    
    var alumnos = ["Luis", "Juan", "Oscar", "Alejandro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for:  indexPath)
        
        cell.textLabel?.text = alumnos[indexPath.row] //se ejecuta el numero de la cantidad del arreglo
        
        return cell
    }
    //se agregaran botones contextules:
    // suif de d _ i trail, i_d lif
    //recibes table view, de der a izq, me regresas los parametros para manipular los botones
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceview, completion) in
            
            self.alumnos.remove(at: indexPath.row)
            self.tablita.deleteRows(at: [indexPath], with: .fade)
            
            completion(true) //dice si se hizo la accion
        }
        //evita que existan muchos if, eso es malo porque telefonos int no tienen programacion lineal porque hace accciones extra (llamadas), acciones esporadicas, -> menejador de eventos
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipeConfiguration

    }
    
}

