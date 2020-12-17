//
//  MockGetLaunchesUseCase.swift
//  SpaceTests
//
//  Created by Mateusz Sawa on 17/12/2020.
//

import Foundation
import Domain
import RxSwift

class MockGetLaunchesUseCase: GetLaunchesUseCaseable {
    private let result: [Launch]
    private let error: Error?

    init(result: [Launch]) {
        self.result = result
        self.error = nil
    }
    
    init(error: Error) {
        self.result = []
        self.error = error
    }
    
    func execute() -> Single<[Launch]> {
        guard let error = error else {
            return .just(result)
        }
        
        return .error(error)
    }
}
