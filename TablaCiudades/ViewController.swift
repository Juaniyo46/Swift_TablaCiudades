//
//  ViewController.swift
//  TablaCiudades
//
//  Created by juan.alvarez on 27/11/2019.
//  Copyright © 2019 Juan Alvarez. All rights reserved.
//

import UIKit

//Se añade uitableviewdelegate y uitableviewdatasource para que puedan gestionar el table view
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    let arrayCiudades = ["Linares","Granada","Málaga","Madrid","Barcelona"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCiudades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //este metodo repite la celda por lo que creamos la celda con su identificador y lo casteamos a nuestra clase nueva.
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CustomCellTableViewCell
        
        cell.labelCell.text = arrayCiudades[indexPath.row]
        cell.imageCell.image = UIImage(named: arrayCiudades[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 204
    }
    


}

