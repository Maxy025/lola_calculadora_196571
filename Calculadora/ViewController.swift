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
    var estado_actual : estados_de_la_calculadora = estados_de_la_calculadora.seleccionar_numeros
    @IBOutlet weak var texto_a_cambiar: UILabel!
    @IBOutlet weak var operaciones: UIButton!
    @IBOutlet weak var stack_view: UIStackView!
    
    
    var botones_interfaz: Dictionary<String, IUBotonCalculadora> = [:]
    var operacion_actual : String? = nil
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        inicializar_calculadora()
        
    }

    @IBAction func que_hace_pushar_boton(_ sender: UIButton) {
        if(estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            
            if let _mensajero_id = sender.restorationIdentifier{
                let texto_cache = botones_interfaz[_mensajero_id]?.numero
                texto_a_cambiar.text = "\(texto_a_cambiar.text ?? "")\(texto_cache!)"
            }
                    
                   
        }
        else if(estado_actual == estados_de_la_calculadora.escoger_operacion){
            if let _mensajero_id = sender.restorationIdentifier{
                operacion_actual = botones_interfaz[_mensajero_id]?.operacion
                estado_actual = estados_de_la_calculadora.seleccionar_numeros
            }
            }
            else{
                operacion_actual = nil
            }
            dibujar_numeros_u_operaciones_en_interfaz()
        }
    
    @IBAction func boton_escoger_operacion_pulsado(_ sender: UIButton){
        if(estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            estado_actual = estados_de_la_calculadora.escoger_operacion
            dibujar_numeros_u_operaciones_en_interfaz()
        }
    }
    func inicializar_calculadora() -> Void{
        crear_arreglo_botones()
        identificar_botones()
    }
    
    func crear_arreglo_botones() -> Void{
        botones_interfaz = IUBotonCalculadora.crear_arreglo_botones()
        
    }
    func dibujar_numeros_u_operaciones_en_interfaz(){
        if(estado_actual == estados_de_la_calculadora.escoger_operacion){
            for elemento in botones_interfaz.values{
                elemento.referencia_a_boton_interfaz?.setTitle(elemento.operacion, for: .normal)
            }
        }
        else if (estado_actual == estados_de_la_calculadora.seleccionar_numeros){
            for elemento in botones_interfaz.values{
                elemento.referencia_a_boton_interfaz?.setTitle(String(elemento.numero), for: .normal)
            }
        }
    }
    
    func identificar_botones(){
        /*
        for componente in self.view.subviews{
            print(componente)
        }
        */
        for pila_de_componentes in stack_view.subviews{
            for boton in pila_de_componentes.subviews{
                print(boton.restorationIdentifier)
                if let identificador = boton.restorationIdentifier{
                    botones_interfaz[identificador]?.referencia_a_boton_interfaz = boton as? UIButton
                }
                
            }
        }
        for elemento in botones_interfaz.values{
            elemento.referencia_a_boton_interfaz?.setTitle("ñ", for: .normal)
        }
    }
}

