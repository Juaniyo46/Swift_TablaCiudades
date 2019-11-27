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
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let arrayCiudades = ["Linares","Granada","Málaga","Madrid","Barcelona"]
    var filteredCiudades = [String]()
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    //buscador
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initializeSearchController()
    }
    
    func initializeSearchController(){
        
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        //Placeholder
        searchController.searchBar.placeholder = "Buscar ciudad"
        
        //añadir el searchbar al navigationItem
        navigationItem.searchController = searchController
        //añadir el searchbar al header de la tabla. para ello tendriamos que crear una variable ocn la tabla sacando un iboutlet.
        //self.tableView.tableHeaderView = self.searchController.searchBar
        
        definesPresentationContext = true
        
        
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
    
    
    func filterContentForSearchText(_ searchText:String) {
        self.filteredCiudades = self.arrayCiudades.filter {
            (city:String) -> Bool in
            
            if city.lowercased().localizedCaseInsensitiveContains(searchText) {
                return true
            }else {
                return false
            }
        }
        
        tableView.reloadData()
    }


}


//extension para buscador
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    
}

