//
//  ViewController.swift
//  Calculadora
//
//  Created by alumno on 8/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var texto_a_cambiar: UILabel!
    //var botones_interfaz:   Array<IUBotonCalculadora> = []
    @IBOutlet weak var operaciones: UIButton!
    var botones_interfaz: Dictionary<String, IUBotonCalculadora> = [:]
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inicializar_calculadora()
    }

    @IBAction func que_hace_pushar_boton(_ sender: UIButton) {
        let text_a_añadir = botones_interfaz[(sender.restorationIdentifier ?? <#default value#>]?.numero
                             texto_a_cambiar.text = "\(texto_a_cambiar.text)\(texto_a_añadir!)"
        print(text_a_añadir)
        // "hola mundo" + "boton7"
        // "hola_mundoboton7"
    }
    
    func inicializar_calculadora() -> Void{
        crear_arreglo_botones()
    }
    
    func crear_arreglo_botones() -> Void{
        for numero in 0...9{
            botones_interfaz["boton_\(numero)"] = IUBotonCalculadora(
                "boton_\(numero)",
                operacion: "")
            )
        }
    }
    
}

