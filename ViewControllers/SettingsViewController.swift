//
//  SettingsViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    //MARK: properties
    var usuario: Usuario!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Actions
    
    @IBAction func updateData(_ sender: UIButton) {
        let userNombre = nombre.text
        let userApellidos = apellidos.text
        let userCorreo = correo.text
        
        if((userNombre?.isEmpty)! || (userApellidos?.isEmpty)! || (userCorreo?.isEmpty)!){
            displayAlert(userMessage: "Se requiere rellenar todos los campos.");
            return;
        }
        // var managedObjectContext = appDelegate.managedObjectContext
        
        DataBaseService().updateUsuario(usuario: usuario, nombre: nombre.text!, apellidos: apellidos.text!, correo: correo.text!, nuevaContraseña: usuario.password)
        
        let alert = UIAlertController(title: "Alerta", message: "Datos modificados exitosamente.", preferredStyle: UIAlertController.Style.alert)
        
        let registerAction = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default){
            action in
            self.dismiss(animated: true, completion: nil);
        }
        alert.addAction(registerAction);
        self.present(alert, animated: true, completion: nil);
         
    }
    
    func displayAlert(userMessage:String){
        let alert = UIAlertController(title: "Alerta", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let registerAction = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default);
        
        alert.addAction(registerAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }

    @IBAction func updatePassword(_ sender: UIButton) {
        let userPassword = password.text
        let userRepeatPassword = repeatpassword.text
        
        if(userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)!{
            displayAlert(userMessage: "Se requiere rellenar todos los campos.");
            return;
        }
        
        if(userPassword != userRepeatPassword){
            displayAlert(userMessage: "Las contraseñas no coinciden.");
            return;
        }
        DataBaseService().updateUsuario(usuario: usuario, nombre: usuario.nombre!, apellidos: usuario.apellidos!, correo: usuario.correo!, nuevaContraseña: userPassword!)
        
        displayAlert(userMessage: "La contraseña ha sido cambiada exitosamente")
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
