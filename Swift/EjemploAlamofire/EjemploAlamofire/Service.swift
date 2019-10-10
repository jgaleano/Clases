//
//  Service.swift
//  EjemploAlamofire
//
//  Created by Julio Cesar Galeano on 10/9/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit
import Alamofire

typealias GenerosClosure = (Generos?) -> Void

class Service: NSObject {

    func getGeneros(completion: @escaping GenerosClosure ) {
        let urlString: String = "https://api.themoviedb.org/3/genre/movie/list?api_key=c039b854e11fae44ee49bde01bad3b74&language=en-US"
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let generos: Generos = try decoder.decode(Generos.self, from: data)
                completion(generos)
            }
            catch {
                print(error)
                completion(nil)
            }
        }
    }
}
