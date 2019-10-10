//
//  ViewController.swift
//  CodableEjemplo
//
//  Created by Julio Cesar Galeano on 10/8/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let jsonString: String = """
        [
          {
            "firstName": "Julio",
            "lastName": "Galeano",
            "country": "Malta",
            "hobbies": [
                {
                    "type": "Sport",
                    "name": "Soccer"
                },
                {
                    "type": "TV",
                    "name": "Terror movies"
                }
            ],
            "father": {
                "name": "Julio Hernan",
                "age": 52
            }
        }
    ]
"""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func decodificarClick(_ sender: Any) {
        if let jsonData: Data = jsonString.data(using: .utf8) {
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let users: [User] = try decoder.decode([User].self, from: jsonData)
                print("\(users[0].firstName) \(users[0].lastName) - \(users[0].country) ")
            }
            catch {
                print(error)
            }
        }
        else {
            print("ERROR EN EL JSON TO DATA")
        }
    }
    
}

