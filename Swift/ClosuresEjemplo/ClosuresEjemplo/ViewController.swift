//
//  ViewController.swift
//  ClosuresEjemplo
//
//  Created by Julio Cesar Galeano on 10/9/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cambiarPorFuncionClick(_ sender: Any) {
        let viewModel: PrimeroViewModel = PrimeroViewModel()
        viewModel.llamarClosure(cambiar: { (valor: String) in
            self.valorLabel.text = valor
        })
        
        viewModel.llamarClosure { (valor: String) in
            self.valorLabel.text = valor
        }
        
        //SegundaForma
        viewModel.llamarClosureConParametris(valor: "SegundoMetodoClosures", cambiar: { [weak self] (valor: String) in
            guard let strongSelf = self else { return }
            strongSelf.valorLabel.text = valor
        })
        
        viewModel.llamarClosureConParametris(valor: "SegundoMetodoClosures") { (valor: String) in
            self.valorLabel.text = valor
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MostrarSegundoControlador" {
            let segundoController = segue.destination as! SegundoViewController
            segundoController.closure = { (valor: String) in
                self.valorLabel.text = valor
            }
        }
    }


}

