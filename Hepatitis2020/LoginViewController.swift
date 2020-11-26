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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: actions
    
    @IBAction func initSesion(_ sender: UIButton) {
        var alert = UIAlertController()
        alert = UIAlertController(title: "Ha habido un error." , message: "", preferredStyle: .alert)
        
        let actionDismiss = UIAlertAction(title: "Cerrar", style: .cancel)
        alert.addAction(actionDismiss)
        
        if(((dni.text?.isEmpty)!) && (password.text?.isEmpty)!){
            alert.message = "Te faltan los datos DNI y contraseña."
            self.present(alert, animated: true, completion: nil)
        }
        else if((dni.text?.isEmpty)! && !(password.text?.isEmpty)!){
            alert.message = "Te falta el DNI."
            self.present(alert, animated: true, completion: nil)
            
        }
        else if(!(dni.text?.isEmpty)! && (password.text?.isEmpty)!){
            alert.message = "Te falta la contraseña."
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            
            
        }
        
    }
    
    
 
    
    
    
    
    
}

