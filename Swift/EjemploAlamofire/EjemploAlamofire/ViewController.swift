//
//  ViewController.swift
//  EjemploAlamofire
//
//  Created by Julio Cesar Galeano on 10/9/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        
        viewModel.getGeneros { (generos: [Genero]) in
            print(generos[0])
        }
    }


}

