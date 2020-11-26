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
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellidos: UITextField!
    @IBOutlet weak var dni: UITextField!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func updateData(_ sender: UIButton) {
    }
    
    @IBAction func updatePassword(_ sender: UIButton) {
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
