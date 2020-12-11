//
//  PacientesTableViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class ListaPacientesViewController: UIViewController {
    var usuario: Usuario!
    var pacientes = [Paciente]()
    var pacientesFiltrados = [Paciente]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
        pacientesFiltrados = pacientes
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "pacientePerfil"){
            let viewDestiny = segue.destination as! PacientePerfilViewController
            let selectedRow = tableView.indexPath(for: sender as! TableViewCellPaciente )?.row
            viewDestiny.paciente = pacientesFiltrados[selectedRow!]
        }
    }
    
}

extension ListaPacientesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pacientesFiltrados.count
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Paciente", for: indexPath) as! TableViewCellPaciente
        
        cell.apellidos.text = pacientesFiltrados[indexPath.row].apellido
        cell.nombre.text = pacientesFiltrados[indexPath.row].nombre
        cell.dni.text = pacientesFiltrados[indexPath.row].dni
        cell.fotoPerfil.image = pacientesFiltrados[indexPath.row].foto
        
        return cell
    }
}

extension ListaPacientesViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange search: String){

        pacientesFiltrados = pacientes
        
        if(searchBar.text?.count == 0){
            tableView.reloadData()
            return
        }
        
        self.pacientesFiltrados = self.pacientes.filter{ (paciente: Paciente) -> Bool in
            if(paciente.nombre.lowercased().contains(searchBar.text!.lowercased())){
                return true
            }
            if(paciente.dni.lowercased().contains(searchBar.text!.lowercased())){
                return true
            }
            if(paciente.sexo.lowercased().contains(searchBar.text!.lowercased())){
                return true
            }
            return false
        }
        
        tableView.reloadData()
    }
}
