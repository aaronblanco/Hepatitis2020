//
//  PacienteClinicDataViewController.swift
//  Hepatitis2020
//
//  Created by aaron on 26/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit


class AddPruebaViewController: UIViewController {

    var paciente: Paciente!
    @IBOutlet weak var fatiga: UISegmentedControl!
    @IBOutlet weak var esple: UISegmentedControl!
    @IBOutlet weak var ascitis: UISegmentedControl!
    @IBOutlet weak var albumina: UITextField!

    @IBOutlet weak var labelResultado: UILabel!
    
    @IBOutlet weak var ResultadoInput: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        limpiar(self)
        
        //Version 1
        #if LPS1
        
        #endif
        #if LPS2
        labelResultado.isHidden = true
        ResultadoInput.isHidden = true
        #endif
        //Version 2
    }
    
    @IBAction func limpiar(_ sender: Any) {
        self.fatiga.selectedSegmentIndex = 0
        self.esple.selectedSegmentIndex = 0
        self.ascitis.selectedSegmentIndex = 0
        self.albumina.text = ""
    }
  
    @IBAction func enviar(_ sender: Any) {
        
        if((albumina.text?.isEmpty)!){
            displayAlert(userMessage: "Se requiere rellenar el campo de albumina.");
            return;
        }
        do{
        let albu = Double(self.albumina.text!)
            if(albu! > 5.0 || albu! < 0){
                displayAlert(userMessage: "El nivel de albumina en sangre no es correcto.");
                return;
            }
            
        }
       
        var fat = false;
        var espl = false;
        var asc = false;
        if(self.fatiga.selectedSegmentIndex >= 1){
            fat = true;
        }
        if(self.esple.selectedSegmentIndex >= 1){
            espl = true;
        }
        if(self.ascitis.selectedSegmentIndex >= 1){
            asc = true;
        }
        let albu = Double(self.albumina.text!)
        DataBaseService().Add_Prueba(paciente: paciente, prueba: Prueba(fatiga: fat, esplenomegalia:espl, ascitis: asc, Nivelalbumina: albu!, numeroPrueba: paciente.pruebas.count+1, resultado: calcularResultado( _fat: fat, _esple: espl,  _asc: asc,  _albu: albu!)))
        
        cancel(self)
        
        
        
        //TODO popUp. Calcular
    }
    
    func calcularResultado(_fat: Bool, _esple: Bool, _asc: Bool, _albu: Double) -> Bool{
       
        #if LPS1
            return indexSeleccted()
        #endif
        #if LPS2
        return Calculo(_fat: Bool, _esple: Bool, _asc: Bool, _albu: Double)
        #endif
    }
    
    func indexSeleccted() -> Bool{
        if(ResultadoInput.selectedSegmentIndex==0){
            return true
        }
        return false
    }
    
    func Calculo(_fat: Bool, _esple: Bool, _asc: Bool, _albu: Double)->Bool{
        if(_asc==false  && _esple==false){
            return false;
        }
        if(_albu > 3.7){
            return false;
        }
        if(paciente.sexo == "Mujer" && _albu <= 2.8){
            return true;
        }
        if(paciente.sexo == "Mujer" && _albu > 3.1){
            return true;
        }
        if(paciente.sexo == "Mujer" && _asc==false){
            return false;
        }
        if(paciente.sexo == "Mujer" && _albu <= 2.9){
            return false;
        }
        if(paciente.sexo == "Mujer"){
            return true;
        }
        
        return false;
    }
    
    
    
    @IBAction func cancel(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
    
    func displayAlert(userMessage:String){
        let alert = UIAlertController(title: "Alerta", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let registerAction = UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default);
        
        alert.addAction(registerAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
