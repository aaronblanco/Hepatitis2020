//
//  Usuario.swift
//  Actividad
//
//  Created by Aula11 on 25/11/20.
//  Copyright © 2020 Alberto. All rights reserved.
//

import UIKit
class Usuario {
    var dni:String
    var password: String
    var nombre: String?
    var apellidos: String?
    var correo: String?
    var pacientes: [Paciente]
    
    init (dni:String, pass:String, nombre:String?, apellidos:String?, correo:String?, pacientes: [Paciente]?){
        self.dni = dni
        self.password = pass
        self.nombre = nombre
        self.apellidos = apellidos
        self.correo = correo
        self.pacientes = pacientes ?? []
    }
    
    func registrarse() {
        
    }
    
    func modificarDatos(){
        
    }
}

