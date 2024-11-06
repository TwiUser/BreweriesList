//
//  BreweriesAPI.swift
//  BreweriesList
//
//  Created by Lavanya K on 05/11/2024.
//
import Foundation

struct BreweriesAPI {
  let environment: Environment
  
  init(environment: Environment) {
    self.environment = environment
  }
}

extension BreweriesAPI {
    var factsURL: URL { getURL(path: "breweries") }

    func getURL(path: String) -> URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
    
    static var dev: Self {
        BreweriesAPI(
            environment: BreweriesEnvironment()
        )
    }
}
