//
//  PrimeroViewModel.swift
//  ClosuresEjemplo
//
//  Created by Julio Cesar Galeano on 10/9/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class PrimeroViewModel: NSObject {
    
    typealias CambiarValorClosure = (String) -> Void
    
    func llamarClosure(cambiar: CambiarValorClosure) {
        cambiar("Cambiado por valor de la funciona llamarClosure")
    }
    
    func llamarClosureConParametris(valor: String, cambiar: CambiarValorClosure) {
        cambiar(valor)
    }
}
