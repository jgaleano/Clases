//
//  Genero.swift
//  EjemploAlamofire
//
//  Created by Julio Cesar Galeano on 10/9/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import Foundation

struct Generos: Codable {
    var genres: [Genero]
}

struct Genero: Codable {
    var id: Int
    var name: String
}
