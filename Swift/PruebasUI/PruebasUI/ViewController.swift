//
//  ViewController.swift
//  PruebasUI
//
//  Created by Julio Cesar Galeano on 10/10/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var cajaTexto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cambiarTextoClick(_ sender: Any) {
        textLabel.text = "Texto cambiado"
    }
    
}

