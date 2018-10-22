//
//  ViewController.swift
//  CollectionView
//
//  Created by macbook on 19/09/18.
//  Copyright © 2018 gato3. All rights reserved.
//

import UIKit

//EL clllection view hay tres tipos:

class ViewController: UIViewController, UICollectionViewDataSource{


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! UIViewControlerCollectionViewCell
        
        cell.numero.text = "\(indexPath.item)"
        cell.backgroundColor = UIColor.red
        return cell
    }
    

}

