//
//  ViewController.swift
//  PrimerEjemploInterfazGrafica
//
//  Created by Julio Cesar Galeano on 9/18/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum Operacion {
        case sumar
        case restar
        case multiplicar
        case dividir
        case cambiarSigno
    }
    
    //MARK: - Atributos IBOutlet
    @IBOutlet weak var cajaTextoLabel: UILabel!
    @IBOutlet weak var sumarButton: UIButton!
    @IBOutlet weak var restarButton: UIButton!
    @IBOutlet weak var multiplicarButton: UIButton!
    @IBOutlet weak var dividirButton: UIButton!
    
    //MARK: - Atributos logicos
    var resultado: Int = 0
    let caracteresDeOperacion: [String] = ["+", "-", "*", "/"]
    var numeroTemporal: String = ""
    var ultimaOperacion: Operacion?
    
    //MARK: - Funciones logicas
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pintarValorLabel(valor: String) {
        cajaTextoLabel.text = valor
    }
    
    func calcular(operacion: Operacion?, valor: Int) {
        guard let valorOperacion: Operacion = operacion else {
            resultado = valor
            return
        }
        
        switch valorOperacion {
        case .sumar:
            resultado += valor
        case .restar:
            resultado -= valor
        case .dividir:
            resultado /= valor
        case .multiplicar:
            resultado *= valor
        default:
            break
        }
    }
    
    func obtenerUltimoCaracter() -> String {
        let valorStr: String = cajaTextoLabel.text ?? ""
        guard let ultimoCaracter: Character = valorStr.last else {
            return ""
        }
        return String(ultimoCaracter)
    }
    
    func concatenarNumeroTemporal(valor: String) {
        numeroTemporal = "\(numeroTemporal)\(valor)"
    }
    
    //MARK: - Operaciones
    @IBAction func clickC(_ sender: Any) {
        resultado = 0
        ultimaOperacion = nil
        sumarButton.isEnabled = true
        restarButton.isEnabled = true
        multiplicarButton.isEnabled = true
        dividirButton.isEnabled = true
        pintarValorLabel(valor: "")
    }
    @IBAction func clickCambioSigno(_ sender: Any) {
    }
    @IBAction func clickPorcentaje(_ sender: Any) {
    }
    @IBAction func clickDividir(_ sender: Any) {
        sumarButton.isEnabled = false
        restarButton.isEnabled = false
        if caracteresDeOperacion.contains(obtenerUltimoCaracter()) {
            return
        }
        guard let valor: Int = Int(numeroTemporal) else {
            return
        }
        calcular(operacion: ultimaOperacion, valor: valor)
        numeroTemporal = ""
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")/")
        ultimaOperacion = ViewController.Operacion.dividir
    }
    @IBAction func clickMultiplicar(_ sender: Any) {
        sumarButton.isEnabled = false
        restarButton.isEnabled = false
        if caracteresDeOperacion.contains(obtenerUltimoCaracter()) {
            return
        }
        guard let valor: Int = Int(numeroTemporal) else {
            return
        }
        calcular(operacion: ultimaOperacion, valor: valor)
        numeroTemporal = ""
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")*")
        ultimaOperacion = ViewController.Operacion.multiplicar
    }
    @IBAction func clickSumar(_ sender: Any) {
        multiplicarButton.isEnabled = false
        dividirButton.isEnabled = false
        if caracteresDeOperacion.contains(obtenerUltimoCaracter()) {
            return
        }
        guard let valor: Int = Int(numeroTemporal) else {
            return
        }
        calcular(operacion: ultimaOperacion, valor: valor)
        numeroTemporal = ""
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")+")
        ultimaOperacion = ViewController.Operacion.sumar
    }
    @IBAction func clickRestar(_ sender: Any) {
        multiplicarButton.isEnabled = false
        dividirButton.isEnabled = false
        if caracteresDeOperacion.contains(obtenerUltimoCaracter()) {
            return
        }
        guard let valor: Int = Int(numeroTemporal) else {
            return
        }
        calcular(operacion: ultimaOperacion, valor: valor)
        numeroTemporal = ""
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")-")
        ultimaOperacion = ViewController.Operacion.restar
    }
    @IBAction func clickIgual(_ sender: Any) {
        sumarButton.isEnabled = true
        restarButton.isEnabled = true
        multiplicarButton.isEnabled = true
        dividirButton.isEnabled = true
        if caracteresDeOperacion.contains(obtenerUltimoCaracter()) {
            return
        }
        guard let valor: Int = Int(numeroTemporal), let ultimaOperacion: Operacion = self.ultimaOperacion else {
            return
        }
        calcular(operacion: ultimaOperacion, valor: valor)
        numeroTemporal = ""
        pintarValorLabel(valor: String(resultado))
    }
    
    //MARK: - Numeros
    @IBAction func click7(_ sender: Any) {
        concatenarNumeroTemporal(valor: "7")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")7")
    }
    @IBAction func click8(_ sender: Any) {
        concatenarNumeroTemporal(valor: "8")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")8")
    }
    @IBAction func click9(_ sender: Any) {
        concatenarNumeroTemporal(valor: "9")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")9")
    }
    @IBAction func click4(_ sender: Any) {
        concatenarNumeroTemporal(valor: "4")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")4")
    }
    @IBAction func click5(_ sender: Any) {
        concatenarNumeroTemporal(valor: "5")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")5")
    }
    @IBAction func click6(_ sender: Any) {
        concatenarNumeroTemporal(valor: "6")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")6")
    }
    @IBAction func click1(_ sender: Any) {
        concatenarNumeroTemporal(valor: "1")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")1")
    }
    @IBAction func click2(_ sender: Any) {
        concatenarNumeroTemporal(valor: "2")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")2")
    }
    @IBAction func click3(_ sender: Any) {
        concatenarNumeroTemporal(valor: "3")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")3")
    }
    
    @IBAction func clickCero(_ sender: Any) {
        concatenarNumeroTemporal(valor: "0")
        pintarValorLabel(valor: "\(cajaTextoLabel.text ?? "")0")
    }
    @IBAction func clickPunto(_ sender: Any) {
    }
}

