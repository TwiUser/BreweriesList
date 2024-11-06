//
//  BreweriesRepository.swift
//  BreweriesList
//
//  Created by Lavanya K on 05/11/2024.
//

protocol BreweriesRepository {
    typealias BreweriesResult = Result<[BreweriesList], BreweriesError>
   func getRandomFact(handler: @escaping (BreweriesResult) -> Void)
}
