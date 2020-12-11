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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let selectedRow = tableView.indexPath(for: sender as! PacienteTableViewCell)?.row
        let viewDestiny = segue.destination as! PacientePerfilViewController
        //viewDestiny.paciente = pacientes[selectedRow!]
        
    }

}

extension ListaPacientesViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pacientesFiltrados.count
        
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PacienteTableViewCell", for: indexPath) as! PacienteTableViewCell
        
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
