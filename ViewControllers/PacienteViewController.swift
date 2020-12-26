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
    @IBOutlet weak var imagenSuperviviencia: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = paciente.nombre
        apellidos.text = paciente.apellido
        dni.text = paciente.dni
        foto.image = paciente.foto
        tableView.delegate = self
        tableView.dataSource = self
        let sup = calcularSuperviviencia()
        if(sup < 0.2){
            
        }
        else if(sup < 0.8 ){
            
        }
        else{
            
        }
        
        
    }
    
    func calcularSuperviviencia() -> Double{
        var media = 0;
        var resultado = 0.0;
        for prueba in pruebas {
            if(prueba.resultado == 100){
                media = media + 1
            }
        }
        resultado = Double(media)/Double(pruebas.count)
        
        return resultado;
    }

    override func viewDidAppear(_ animated: Bool) {
        pruebas = DataBaseService().getPruebas(dni: paciente.dni)!
        paciente.pruebas = pruebas
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
        cell.resultado = Double(pruebas[indexPath.row].resultado)
        
        cell.viewcontroller = self
        
        return cell
    }
    
}
