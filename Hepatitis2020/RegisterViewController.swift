//
//  RegisterViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

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
    }
    
    
    @IBAction func cancelar(_ sender: UIButton) {
    }
    

}
