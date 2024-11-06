//
//  BreweriesViewModel.swift
//  BreweriesList
//
//  Created by Lavanya K on 05/11/2024.
//

final class BreweriesViewModel {
    private let repository: BreweriesRepository
  
    private let onSuccess: (_ listValue: [BreweriesList]) -> Void
  private let onError: (_ errorMessage: String) -> Void
  
  init(
    repository: BreweriesRepository,
    onSuccess: @escaping (_ listValue: [BreweriesList]) -> Void,
    onError: @escaping (_ errorMessage: String) -> Void
  ) {
    self.repository = repository
    self.onSuccess = onSuccess
    self.onError = onError
  }

  func fetchBreweriesList() {
    repository.getRandomFact { [unowned self] result in
      switch result {
      case .success(let breweriesData):
        self.onSuccess(breweriesData)
      case .failure(let error):
        self.onError(error.localizedDescription)
      }
    }
  }
}

// MARK: - User interaction
extension BreweriesViewModel {
  enum UserInput {
    case fetchFactClicked
  }
  
  func onUserInput(_ input: UserInput) {
    switch input {
    case .fetchFactClicked:
        fetchBreweriesList()
    }
  }
}
