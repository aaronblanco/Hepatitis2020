//
//  UsuarioNSObject.swift
//  Hepatitis2020
//
//  Created by Bruno on 25/11/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit
import CoreData
class UsuarioNSObject: NSObject {

    
    override init() {
        super.init()
    }
    
    init?(usuario: Usuario){
        super.init()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UsuarioEntity", in: managedContext)!
        let insercion = NSManagedObject(entity: entity, insertInto: managedContext)
        
        do {
         //   insercion.setValue(usuario.dni, forKey: "dni")
         //   insercion.setValue(usuario.password, forKey: "password")
            
          /*  for paciente in usuario.pacientes {
                let _ = PacienteNSOBject.init(paciente: paciente, usuario: insercion)
            }*/
            
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
}
