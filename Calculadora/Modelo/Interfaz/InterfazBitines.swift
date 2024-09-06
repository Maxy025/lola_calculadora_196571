//
//  InterfazBitines.swift
//  Calculadora
//
//  Created by alumno on 9/6/24.
//

import Foundation

//  Interfaz Usuario [Nombre de la clase o estructura]
struct IUBotonCalculadora {
    var id: String
    var numero: Character
    var operacion: String
    
    init (_ id:String, numero: Character, operacion: String){
        self.id = id
        self.numero = numero
        self.operacion = operacion
        
    }
}
