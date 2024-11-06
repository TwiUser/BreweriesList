//
//  HTTPClient.swift
//  BreweriesList
//
//  Created by Lavanya K on 04/11/2024.
//
import Foundation

public protocol HTTPClient {
  typealias ResponseResult = Result<Data, Error>
  func get(_ url: URL, responseHandler: @escaping (ResponseResult) -> Void)
}
