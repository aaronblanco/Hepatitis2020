//
//  RegisterViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    //MARK: properties
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var dni: UITextField!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repetirPassword: UITextField!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        //MARK: actions
    
    @IBAction func registrarDoctor(_ sender: UIButton) {
        
        let userNombre = nombre.text
        let userApellidos = apellidos.text
        let userDni = dni.text
        let userCorreo = correo.text
        let userPassword = password.text
        let userRepeatPassword = repetirPassword.text
        
        
        if((userNombre?.isEmpty)! || (userApellidos?.isEmpty)! || (userDni?.isEmpty)! || (userCorreo?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!){
            displayAlert(userMessage: "Se requiere rellenar todos los campos.");
            return;
        }
        
        if(userPassword != userRepeatPassword){
            displayAlert(userMessage: "Las contraseñas no coinciden.");
            return;
        }
       
        let alert = UIAlertController(title: "Alerta", message: "Registro completado exitosamente.", preferredStyle: UIAlertController.Style.alert)
        
        let registerAction = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default){
            action in
            self.dismiss(animated: true, completion: nil);
        }
        alert.addAction(registerAction);
        
        DataBaseService().Add_Usuario(usuario: Usuario(dni: userDni!, pass: userPassword!, nombre: userNombre!, apellidos: userApellidos!, correo: userCorreo!, pacientes: nil))
        
        self.present(alert, animated: true, completion: nil);
    }
    
    
    
    func displayAlert(userMessage:String){
        let alert = UIAlertController(title: "Alerta", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let registerAction = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default);
        
        alert.addAction(registerAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
   
    
}
