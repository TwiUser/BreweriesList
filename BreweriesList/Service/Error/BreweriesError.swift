//
//  BreweriesError.swift
//  BreweriesList
//
//  Created by Lavanya K on 05/11/2024.
//

import Foundation
enum BreweriesError: Error {
  case notParsable(Data)
  case fetchError(Error)
}
