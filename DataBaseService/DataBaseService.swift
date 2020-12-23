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

    
    func Add_Usuario(usuario: Usuario){
        
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
                    Add_Paciente(usuario: insercion, paciente: paciente)
                }
            }
            
            
            
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func Add_Paciente(usuario: NSObject, paciente: Paciente){
        
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
            
            insercion.setValue(usuario, forKey: "medico")
            if( !paciente.pruebas.isEmpty){
                for prueba in paciente.pruebas {
                    Add_Prueba(paciente: insercion, prueba: prueba)
                }
            }
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func Add_Paciente(usuario: Usuario, paciente: Paciente){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        

       
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UsuarioEntity")
        fetchRequest.predicate = NSPredicate(format: "dni=%@", usuario.dni)
        
        let entity = NSEntityDescription.entity(forEntityName: "PacienteEntity", in: managedContext)!
        let insercion = NSManagedObject(entity: entity, insertInto: managedContext)
        
        do {
            let usuario = try managedContext.fetch(fetchRequest)[0]
            insercion.setValue(paciente.dni, forKey: "dni")
            insercion.setValue(paciente.apellido, forKey: "apellido")
            /**/   insercion.setValue(paciente.fechaNacimiento, forKey: "fechaNacimiento")
            
            let imageData = paciente.foto!.pngData()
            insercion.setValue(imageData, forKey: "imagen")
            
            insercion.setValue(paciente.nombre, forKey: "nombre")
            insercion.setValue(paciente.sexo, forKey: "sexo")
            
            insercion.setValue(usuario, forKey: "medico")
            if( !paciente.pruebas.isEmpty){
                for prueba in paciente.pruebas {
                    Add_Prueba(paciente: insercion, prueba: prueba)
                }
            }
            
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func Add_Prueba(paciente: NSObject, prueba: Prueba){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PruebaEntity", in: managedContext)!
        let insercion = NSManagedObject(entity: entity, insertInto: managedContext)
        
        do {
            insercion.setValue(prueba.ascitis, forKey: "ascitis")
            insercion.setValue(prueba.esplenomegalia, forKey: "esplenomegalia")
            insercion.setValue(prueba.fatiga, forKey: "fatiga")
            insercion.setValue(prueba.nivelAlbumina, forKey: "nivelBulimia")
            insercion.setValue(prueba.numeroPrueba, forKey: "numeroPrueba")
            insercion.setValue(prueba.resultado, forKey: "resultado")
            insercion.setValue(paciente, forKey: "paciente")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func Add_Prueba(paciente: Paciente, prueba: Prueba){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PruebaEntity", in: managedContext)!
        let insercion = NSManagedObject(entity: entity, insertInto: managedContext)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PacienteEntity")
        fetchRequest.predicate = NSPredicate(format: "dni=%@", paciente.dni)
       
        do {
            let paciente = try managedContext.fetch(fetchRequest)[0]
            insercion.setValue(prueba.ascitis, forKey: "ascitis")
            insercion.setValue(prueba.esplenomegalia, forKey: "esplenomegalia")
            insercion.setValue(prueba.fatiga, forKey: "fatiga")
            insercion.setValue(prueba.nivelAlbumina, forKey: "nivelBulimia")
            insercion.setValue(prueba.numeroPrueba, forKey: "numeroPrueba")
            insercion.setValue(prueba.resultado, forKey: "resultado")
            insercion.setValue(paciente, forKey: "paciente")
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func updateUsuario(usuario: Usuario, nombre: String, apellidos: String, correo: String, nuevaContraseña: String){
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
            do{
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UsuarioEntity")
                fetchRequest.predicate = NSPredicate(format: "dni=%@", usuario.dni)
                
                var insercion = try managedContext.fetch(fetchRequest)
                
                insercion[0].setValue(nombre, forKey: "nombre")
                insercion[0].setValue(apellidos, forKey: "apellido")
                insercion[0].setValue(correo, forKey: "correo")
                insercion[0].setValue(nuevaContraseña, forKey: "password")
                
                try managedContext.save()
                
            }  catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
    }
    
    func updatePaciente(paciente: Paciente, nombre: String, apellidos: String, dni: String, sexo: String, fechaNacimiento: Date, imagen: UIImage){
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do{
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PacienteEntity")
            fetchRequest.predicate = NSPredicate(format: "dni=%@", paciente.dni)
            
            var insercion = try managedContext.fetch(fetchRequest)
            
            insercion[0].setValue(nombre, forKey: "estado")
            insercion[0].setValue(apellidos, forKey: "apellidos")
            insercion[0].setValue(dni, forKey: "dni")
            insercion[0].setValue(sexo, forKey: "sexo")
            insercion[0].setValue(fechaNacimiento, forKey: "fechaNacimiento")
            
            let imageData = imagen.pngData()
            insercion[0].setValue(imageData, forKey: "imagen")
            
            try managedContext.save()
            
        }  catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func getUsuario(dni: String) -> NSManagedObjectID?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UsuarioEntity")
        fetchRequest.predicate = NSPredicate(format: "dni=%@", dni)
        do{
            return try managedContext.fetch(fetchRequest)[0].objectID
        }catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        return nil
    }
    
    func getPaciente(dni: String) -> NSManagedObjectID?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PacienteEntity")
        fetchRequest.predicate = NSPredicate(format: "dni=%@", dni)
        do{
            return try managedContext.fetch(fetchRequest)[0].objectID
        }catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        return nil
    }
    
    func getPruebas(dni: String) -> [Prueba]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PruebaEntity")
        let fetchPaciente = NSFetchRequest<NSManagedObject>(entityName: "PacienteEntity")
        
        do{
            fetchPaciente.predicate = NSPredicate(format: "dni=%@", dni)
            let paciente = try? managedContext.fetch(fetchPaciente)[0]
            fetchRequest.predicate = NSPredicate(format: "paciente=%@", paciente!)
            let pruebas = try managedContext.fetch(fetchRequest)
            var salida = [Prueba]()
            
            let sortPrueba = NSSortDescriptor(key: "numeroPrueba", ascending: false)
            fetchRequest.sortDescriptors = [sortPrueba]
            for prueba in pruebas {
                
                salida.append(Prueba(fatiga: prueba.value(forKey: "fatiga") as! Int, esplenomegalia: prueba.value(forKey: "esplenomegalia") as! Int, ascitis: prueba.value(forKey: "ascitis") as! Int, Nivelalbumina: prueba.value(forKey: "nivelBulimia") as! Int, numeroPrueba: prueba.value(forKey: "numeroPrueba") as! Int, resultado: prueba.value(forKey: "resultado") as! Double))
            }
            
            return salida
        }catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        return nil
    }
    
    func getUsuario(key: NSManagedObjectID) -> Usuario?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        do{
            let fetchRequest = try managedContext .existingObject(with: key)
            
            return Usuario(dni: fetchRequest.value(forKey: "dni") as! String, pass: fetchRequest.value(forKey: "password") as! String, nombre: (fetchRequest.value(forKey: "nombre") as! String), apellidos: (fetchRequest.value(forKey: "apellido") as! String), correo: (fetchRequest.value(forKey: "correo") as! String), pacientes: getDatos_Usuario(id_usuario: key)!)
        }catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        return nil
    }
    
    func getDatos_Usuario(id_usuario: NSManagedObjectID) -> [Paciente]?{
        var resultado = [Paciente]()
        var fotoAux: UIImage?
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            let usuario = try managedContext .existingObject(with: id_usuario)
            
            let fetchRequestPaciente = NSFetchRequest<NSManagedObject>(entityName: "PacienteEntity")
            fetchRequestPaciente.predicate = NSPredicate(format: "medico=%@", usuario)
            
            let sortPaciente = NSSortDescriptor(key: "nombre", ascending: true)
            fetchRequestPaciente.sortDescriptors = [sortPaciente]
            
            let pacientes = try managedContext.fetch(fetchRequestPaciente)
            
            for paciente in pacientes {
                
                
                if let imageData = paciente.value(forKey: "imagen") as? NSData {
                    if let image = UIImage(data: Data(referencing: imageData)) {
                        fotoAux = image
                    }
                }
                
                resultado.append(Paciente(nombre: paciente.value(forKey: "nombre") as! String, apellido: paciente.value(forKey: "apellido") as! String, dni: paciente.value(forKey: "dni") as! String, sexo: paciente.value(forKey: "sexo") as! String, fechaNacimiento: paciente.value(forKey: "fechaNacimiento") as! Date, foto: fotoAux, pruebas: getPruebas(dni: paciente.value(forKey: "dni") as! String)))
                
            }
            
            return resultado
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return nil
    }

    
    func BD_IsEmpty() -> Bool
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return false}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UsuarioEntity")
        
        do {
            
            if try managedContext.fetch(fetchRequest).count < 1{
                return true
            }else{
                return false
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return false
        
    }

    func login(dni: String, password: String) -> Bool{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UsuarioEntity")
        fetchRequest.predicate = NSPredicate(format: "dni==%@ and password==%@", dni, password)
        
        do {
            if(try managedContext.fetch(fetchRequest).count > 0){
                return true
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    


}
