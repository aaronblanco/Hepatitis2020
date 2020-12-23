//
//  PacientePersonalDataViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 26/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class AddPacienteViewController: UIViewController {
    
    var usuario: Usuario!
    
    @IBOutlet weak var nombre: UITextField!
    
    @IBOutlet weak var Apellidos: UITextField!
    
    @IBOutlet weak var DNI: UITextField!
    
    @IBOutlet weak var sexo: UISegmentedControl!
    
    @IBOutlet weak var date: UIDatePicker!
    
    @IBOutlet weak var foto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        limpiar(self)
        // Do any additional setup after loading the view.
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func limpiar(_ sender: Any) {
        self.nombre.text = ""
        self.Apellidos.text = ""
        self.DNI.text = ""
        self.sexo.selectedSegmentIndex = 0
        
        
    }
    
    @IBAction func crear(_ sender: Any) {
        
        
        
        if((nombre.text?.isEmpty)! || (Apellidos.text?.isEmpty)! || (DNI.text?.isEmpty)! ){
            displayAlert(userMessage: "Se requiere rellenar todos los campos.");
            return;
            
        }
        

        DataBaseService().Add_Paciente(usuario: usuario, paciente: Paciente(nombre: nombre.text!, apellido: Apellidos.text!, dni: DNI.text!, sexo: indexSeleccted(), fechaNacimiento: date.date, foto: foto.image, pruebas: nil))
        
        cancel(self)
    }
    
    func indexSeleccted() -> String{
        if(sexo.selectedSegmentIndex==0){
            return "Hombre"
        }
        return "Mujer"
    }
    
    func displayAlert(userMessage:String){
        let alert = UIAlertController(title: "Alerta", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let registerAction = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default);
        
        alert.addAction(registerAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }

    
}
