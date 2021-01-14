//
//  PacientesTableViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

extension NSNotification.Name {
    static let globalVariableChanged = NSNotification.Name(Bundle.main.bundleIdentifier! + ".globalVariable")
}

var actualizarTablas: Bool = true{
    didSet{
        NotificationCenter.default.post(name: .globalVariableChanged, object: nil)
    }
    
}

class ListaPacientesViewController: UIViewController {
    var usuario: Usuario!
    var pacientes = [Paciente]()
    var pacientesFiltrados = [Paciente]()
    
    private var observer: NSObjectProtocol!

    
        
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        pacientes = DataBaseService().getDatos_Usuario(id_usuario: DataBaseService().getUsuario(dni: usuario.dni)!)!
        pacientesFiltrados = pacientes
        usuario.pacientes = pacientes
        observer = NotificationCenter.default.addObserver(forName: .globalVariableChanged, object: nil, queue: .main) { [weak self] notification in self!.tableView.reloadData()}
        actualizarTablas = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "pacientePerfil"){
            let viewDestiny = segue.destination as! PacienteViewController
            let selectedRow = tableView.indexPath(for: sender as! TableViewCellPaciente )?.row
            viewDestiny.paciente = pacientesFiltrados[selectedRow!]
        }
        if(segue.identifier == "añadir"){
            let viewDestiny = segue.destination as! AddPacienteViewController
            viewDestiny.usuario = usuario
        }
        if(segue.identifier == "editar"){
            let ViewDestiny = segue.destination as! SettingsViewController
            ViewDestiny.usuario = usuario
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
