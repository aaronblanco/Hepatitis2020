//
//  SupervivenciaComponentController.swift
//  Hepatitis2020
//
//  Created by Bruno on 26/12/2020.
//  Copyright © 2020 ual. All rights reserved.
//

import UIKit

class SupervivenciaComponentController: UIImageView{
    
    func setImage(pruebas: [Prueba]) {

        var media = 0;
        var resultado = 0.0;
        for prueba in pruebas {
            if(prueba.resultado == true){
                media = media + 1
            }
        }
        resultado = Double(media)/Double(pruebas.count)
        
        if(resultado < 0.2){
            self.image = UIImage(named: "sad")
        }
        else if(resultado < 0.8 ){
            self.image = UIImage(named: "medium")
        }
        else{
            self.image = UIImage(named: "smile")
        }
    }
    
}
