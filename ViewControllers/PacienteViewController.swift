//
//  PacientePerfilViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 09/12/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit



class PacienteViewController: UIViewController {
    
    var paciente: Paciente!
    var pruebas = [Prueba]()
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var apellidos: UILabel!
    @IBOutlet weak var dni: UILabel!
    @IBOutlet weak var foto: UIImageView!
    
    @IBOutlet weak var imagenSuperviviencia: SupervivenciaComponentController!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = paciente.nombre
        apellidos.text = paciente.apellido
        dni.text = paciente.dni
        foto.image = paciente.foto
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        pruebas = DataBaseService().getPruebas(dni: paciente.dni)!
        paciente.pruebas = pruebas
        imagenSuperviviencia.setImage(pruebas: pruebas)
        imagenSuperviviencia.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.reloadData()
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewDestiny = segue.destination as! AddPruebaViewController

        viewDestiny.paciente = paciente
        
    }
}

extension PacienteViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pruebas.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prueba", for: indexPath) as! TableViewCellPrueba
        cell.numero.text = String(pruebas[indexPath.row].numeroPrueba)
        if(pruebas[indexPath.row].resultado == true){
            cell.resultado = "Sobrevive"
        }else{
            cell.resultado = "Fallece"
        }
        
        
        cell.viewcontroller = self
        
        return cell
    }
    
}
