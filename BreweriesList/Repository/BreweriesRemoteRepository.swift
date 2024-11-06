//
//  BreweriesRemoteRepository.swift
//  BreweriesList
//
//  Created by Lavanya K on 05/11/2024.
//

import Foundation

final internal class BreweriesRemoteRepository: BreweriesRepository {
    
    func getRandomFact(handler: @escaping (BreweriesResult) -> Void) {
        httpClient.get(api.factsURL) { [unowned self] result in
          self.execute {
            switch result {
            case .success(let data):
                if let dto = Self.parse(type: [BreweriesList].self, data: data) {
                handler(.success(dto))
              } else {
                handler(.failure(.notParsable(data)))
              }
            case .failure(let error):
              handler(.failure(.fetchError(error)))
            }
          }
        }
    }
    
  private let httpClient: HTTPClient
  private let api: BreweriesAPI
  private let executionQueue: DispatchQueue
  
  internal init(
    httpClient: HTTPClient,
    api: BreweriesAPI,
    executionQueue: DispatchQueue = .main
  ) {
    self.httpClient = httpClient
    self.api = api
    self.executionQueue = executionQueue
  }
  
  
  // MARK: - Helpers
  private func execute(action: @escaping () -> Void) {
    executionQueue.async(execute: action)
  }
  
  private static func parse<T: Decodable>(type: T.Type, data: Data) -> T? {
    return try? JSONDecoder().decode(T.self, from: data)
  }
}


