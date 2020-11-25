//
//  UsuarioNSObject.swift
//  Hepatitis2020
//
//  Created by Bruno on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData

class DataBaseService {

    
    func llenarDataBase_User(usuario: Usuario){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UsuarioEntity", in: managedContext)!
        let insercion = NSManagedObject(entity: entity, insertInto: managedContext)
        
        do {
            insercion.setValue(usuario.dni, forKey: "dni")
            insercion.setValue(usuario.password, forKey: "password")
            if(usuario.apellidos != nil){
                insercion.setValue(usuario.apellidos, forKey: "apellido")
            }
            if(usuario.correo != nil){
                insercion.setValue(usuario.correo, forKey: "correo")
            }
            if(usuario.nombre != nil){
                insercion.setValue(usuario.nombre, forKey: "nombre")
            }
            
            if( !usuario.pacientes.isEmpty){
                for paciente in usuario.pacientes {
                    llenarDataBase_Paciente(usuario: insercion, paciente: paciente)
                }
            }
            
            
            
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func llenarDataBase_Paciente(usuario: NSObject, paciente: Paciente){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PacienteEntity", in: managedContext)!
        let insercion = NSManagedObject(entity: entity, insertInto: managedContext)
        
        do {
            
            insercion.setValue(paciente.dni, forKey: "dni")
            insercion.setValue(paciente.apellido, forKey: "apellido")
     /**/   insercion.setValue(paciente.fechaNacimiento, forKey: "fechaNacimiento")
            
            let imageData = paciente.foto!.pngData()
            insercion.setValue(imageData, forKey: "imagen")
            
            insercion.setValue(paciente.nombre, forKey: "nombre")
            insercion.setValue(paciente.sexo, forKey: "sexo")
            
            if( !paciente.pruebas.isEmpty){
                for prueba in paciente.pruebas {
                    llenarDataBase_Prueba(paciente: insercion, prueba: prueba)
                }
            }
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func llenarDataBase_Prueba(paciente: NSObject, prueba: Prueba){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TestEntity", in: managedContext)!
        let insercion = NSManagedObject(entity: entity, insertInto: managedContext)
        
        do {
            insercion.setValue(prueba.ascitis, forKey: "ascitis")
            insercion.setValue(prueba.esplenomegalia, forKey: "esplenomegalia")
            insercion.setValue(prueba.fatiga, forKey: "fatiga")
            insercion.setValue(prueba.nivelBulimia, forKey: "nivelBulimia")
            insercion.setValue(prueba.numeroPrueba, forKey: "numeroPrueba")
            insercion.setValue(prueba.resultado, forKey: "resultado")
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}
