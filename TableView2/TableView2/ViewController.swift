//
//  ViewController.swift
//  TableView2
//
//  Created by Germán Santos Jaimes on 9/3/18.
//  Copyright © 2018 iosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tablita: UITableView!
    var alumnos = ["Juan", "Oscar", "Erick", "Luis"]
    var chicas = ["burbuja", "bellota", "bonbon"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count//
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = alumnos[indexPath.row] //
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceview, completion) in
            //
            self.alumnos.remove(at: indexPath.row)
            
            self.tablita.deleteRows(at: [indexPath], with: .fade )
            
            
            completion(true)
            
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceview, completion) in
            
            
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
        
    }
    //UNWIND SEGUES             si por aqui te fuiste por aqui te regresas
    @IBAction func unwindSecondView(sigue: UIStoryboardSegue){
        
    }
    //preparate para lo que sigue se ejecuta primero
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondView"{
        //los datos los tiene el table view, tengo que ligarlo al codigo (tablita
        let indexPath = tablita.indexPathForSelectedRow
                                //usalo como view controller
        let destination = segue.destination as! SecondViewController
            
            destination.frontFirstViewController = alumnos[(indexPath?.row)!]//dale al fix //
        }
        
    }

}

