//
//  ViewController.swift
//  Hepatitis2020
//
//  Created by Bruno on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: properties
    
    @IBOutlet weak var dni: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iniciarAplicacion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: actions
    
    @IBAction func initSesion(_ sender: UIButton) {
        let _ = shouldPerformSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier:
        String?, sender: Any?) -> Bool {
        
        var alert = UIAlertController()
        alert = UIAlertController(title: "Ha habido un error." , message: "", preferredStyle: .alert)
        
        let actionDismiss = UIAlertAction(title: "Cerrar", style: .cancel)
        alert.addAction(actionDismiss)
        
        if (identifier != "loginSegue") {
            return true
        }
        
        if self.dni.text == nil || self.password.text?.count == 0 {
            alert.message = "Faltan datos."
            self.present(alert, animated: true, completion: nil)
            return false
        }

        if (DataBaseService().login(dni: self.dni.text!, password: self.password.text!)){
            return true
        }
        
        alert.message = "Error al iniciar sesión."
        self.present(alert, animated: true, completion: nil)
        
        return false
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "loginSegue"){
            let viewDestiny = segue.destination as! ListaPacientesViewController
            
            viewDestiny.pacientes = DataBaseService().getDatos_Usuario(id_usuario: DataBaseService().getUsuario(dni: self.dni.text!)!)!
            viewDestiny.usuario = DataBaseService().getUsuario(key: DataBaseService().getUsuario(dni: self.dni.text!)!)
        }
    }
    
    func iniciarAplicacion(){
        if(DataBaseService().BD_IsEmpty()){
            
            let prueba = Prueba(fatiga: 100, esplenomegalia: 100, ascitis: 100, nivelBulimia: 100, numeroPrueba: 100, resultado: 100)
            
            let paciente = Paciente(nombre: "admin", apellido: "istrador delforo", dni: "00000001A", sexo: "Hombre", fechaNacimiento: Date(), foto: #imageLiteral(resourceName: "PacienteDefecto"), pruebas: [prueba])
            let usuario = Usuario(dni: "00000001A", pass: "admin", nombre: "admin", apellidos: "istrador delforo", correo: "admin@gmukil.com", pacientes: [paciente])
            
            DataBaseService().Add_Usuario(usuario: usuario)
        }
    }
}


