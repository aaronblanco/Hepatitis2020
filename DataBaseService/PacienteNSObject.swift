//
//  PacienteNSObject.swift
//  Hepatitis2020
//
//  Created by Bruno on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData
class PacienteNSObject: NSObject {

    
    override init() {
        super.init()
    }
    
    init?(paciente: Paciente){
        super.init()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PacienteEntity", in: managedContext)!
        let insercion = NSManagedObject(entity: entity, insertInto: managedContext)
        
        do {
            //   insercion.setValue(paciente.nombre, forKey: "nombre")
            //   insercion.setValue(paciente.apellidos, forKey: "apellidos")
            //   insercion.setValue(paciente.dni, forKey: "dni")
            //   insercion.setValue(paciente.sexo, forKey: "sexo")
            //   insercion.setValue(paciente.fechaNacimiento, forKey: "password")
            ////   insercion.setValue(paciente, forKey: "password")
            
            
            /*  for paciente in usuario.pacientes {
             let _ = PacienteNSOBject.init(paciente: paciente, usuario: insercion)
             }*/
            
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
}
