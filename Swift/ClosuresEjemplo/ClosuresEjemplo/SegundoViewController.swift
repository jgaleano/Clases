//
//  SegundoViewController.swift
//  ClosuresEjemplo
//
//  Created by Julio Cesar Galeano on 10/9/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class SegundoViewController: UIViewController {

    @IBOutlet weak var valueTextField: UITextField!
    
    typealias CambiarValorClosure = (String) -> Void
    var closure: CambiarValorClosure?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickCambiarValor(_ sender: Any) {
        closure?(valueTextField.text ?? "Sin valor")
        self.navigationController?.popViewController(animated: true)
    }

}
