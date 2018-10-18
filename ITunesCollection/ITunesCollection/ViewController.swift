//
//  ViewController.swift
//  ITunesCollection
//
//  Created by macbook on 26/09/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource{

    var lista: [Track] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lista.count //cuantas celdas va a pitar
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! itemCollectionView
        
        cell.backgroundColor = UIColor.blue
        cell.titulo.text = lista[indexPath.row].trackName //n_esimo track dame el nombre
        cell.precio.text = String(lista[indexPath.row].trackPrice)
        
        //Para la imagen:
        let url = URL(string: lista[indexPath.row].atworkUrl100)
        let data = try? Data(contentsOf: url!)
        let image = UIImage(data: data!)
        
        cell.portada.image = image
        
        //Notita expres: evitar palabra urgencia con los planes b's
        // urgencia: lo hice yo, me afecta  a mi; me importa ??
        
        return cell
    }
    
    func fetchData(){
                                                                // sin espacios
    let url = URL(string: "https://itunes.apple.com/search?term='ACDC'")!
    
    let jsonDecoder = JSONDecoder()
    
    
    
    let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
        
        if let datos = data, let resultado = try? jsonDecoder.decode(Resultados.self, from: datos){
            
            resultado.results.forEach({ (track) in
                //print(track.trackName, track.trackPrice)
                //metimos elemntos a la lista:
                self.lista.append(Track(trackName: track.trackName, trackPrice: track.trackPrice, atworkUrl100: track.atworkUrl100))
                
            })
            //hay que decirle que recargue los datos, primero imprime luego llena
            // para ello hago un oulet al collection View
            // ->self.collectionView.reloadData()
            //proceso paralelo : empizan y terminan igual
            // " serial: empiezan hasta que otro termina
            //" concurrencia: dos inician igual pero no necesariamente terminan al mismo tiempo
            //1er plano recargar datos, 2do plano pintar; necesitamos procesos concurrentes
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
        task.resume()
    }

}

