//
//  Paciente.swift
//  Actividad
//
//  Created by Aula11 on 25/11/20.
//  Copyright © 2020 Alberto. All rights reserved.
//
import UIKit
class Paciente {
    var nombre:String
    var apellido:String
    var dni:String
    var sexo:String
    var fechaNacimiento:Date
    var foto:UIImage?
    var pruebas: [Prueba]
    
    init ( nombre:String, apellido:String, dni:String, sexo:String, fechaNacimiento:Date, foto:UIImage?, pruebas: [Prueba]?){
        self.nombre = nombre
        self.apellido = apellido
        self.dni = dni
        self.sexo = sexo
        self.fechaNacimiento = fechaNacimiento
        self.foto = foto
        self.pruebas = pruebas ?? []
    }
}
