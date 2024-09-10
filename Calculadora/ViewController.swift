//
//  ViewController.swift
//  Calculadora
//
//  Created by alumno on 8/30/24.
//

import UIKit


enum estados_de_la_calculadora{
    case seleccionar_numeros
    case escoger_operacion
    case mostrar_resultado
}
class ViewController: UIViewController {

    @IBOutlet weak var texto_a_cambiar: UILabel!
    @IBOutlet weak var operaciones: UIButton!
    
    
    var botones_interfaz: Dictionary<String, IUBotonCalculadora> = [:]
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        inicializar_calculadora()
        
    }

    @IBAction func que_hace_pushar_boton(_ sender: UIButton) {
        let text_a_añadir = botones_interfaz[(sender.restorationIdentifier ?? operaciones.restorationIdentifier) ?? "boton"]?.numero
                    
                    texto_a_cambiar.text = "\(texto_a_cambiar.text ?? "")\(text_a_añadir!)"

    }
    
    func inicializar_calculadora() -> Void{
        crear_arreglo_botones()
    }
    
    func crear_arreglo_botones() -> Void{
        botones_interfaz = IUBotonCalculadora.crear_arreglo_botones()
        
    }
    
}

