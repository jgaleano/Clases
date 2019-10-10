//
//  User.swift
//  CodableEjemplo
//
//  Created by Julio Cesar Galeano on 10/8/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import Foundation

struct User: Codable {
    var firstName: String
    var lastName: String
    var country: String
    var hobbies: [Hobbie]
}

struct Hobbie: Codable {
    var type: String
    var name: String
}
