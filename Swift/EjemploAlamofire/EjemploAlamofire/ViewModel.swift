//
//  ViewModel.swift
//  EjemploAlamofire
//
//  Created by Julio Cesar Galeano on 10/9/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

typealias ArrayGenerosClosure = ([Genero]) -> Void

class ViewModel: NSObject {
    
    func getGeneros(completion1: @escaping ArrayGenerosClosure) {
        let servicio: Service = Service()
        servicio.getGeneros { generos in
            completion1(generos?.genres ?? [])
        }
    }
}
