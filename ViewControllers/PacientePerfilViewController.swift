//
//  PacientePerfilViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 09/12/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class PacientePerfilViewController: UIViewController {

    var paciente: Paciente!
    var pruebas = [Prueba]()
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var apellidos: UILabel!
    @IBOutlet weak var dni: UILabel!
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var imagenSuperviviencia: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = paciente.nombre
        apellidos.text = paciente.apellido
        dni.text = paciente.dni
        foto.image = paciente.foto
        pruebas = paciente.pruebas
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PacientePerfilViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pruebas.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prueba", for: indexPath) as! TableViewCellPrueba
        cell.numero.text = String(pruebas[indexPath.row].numeroPrueba)
        cell.viewcontroller = self
        return cell
    }
    
}
