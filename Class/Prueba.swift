//
//  Prueba.swift
//  Actividad
//
//  Created by Aula11 on 25/11/20.
//  Copyright © 2020 Alberto. All rights reserved.
//

import UIKit
class Prueba {
    var fatiga: Bool
    var esplenomegalia: Bool
    var ascitis: Bool
    var nivelAlbumina: Double
    var numeroPrueba: Int
    var resultado: Bool
    
    init(fatiga:Bool, esplenomegalia:Bool, ascitis:Bool, Nivelalbumina:Double, numeroPrueba:Int, resultado: Bool){
        self.fatiga = fatiga
        self.esplenomegalia = esplenomegalia
        self.ascitis = ascitis
        self.nivelAlbumina = Double(Nivelalbumina)
        self.numeroPrueba = numeroPrueba
        self.resultado = resultado
    }
}

