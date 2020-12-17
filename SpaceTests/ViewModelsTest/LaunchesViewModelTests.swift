//
//  LaunchesViewModelTests.swift
//  SpaceTests
//
//  Created by Mateusz Sawa on 17/12/2020.
//

import Foundation
import XCTest
import Domain
import RxSwift
import RxBlocking
import Nimble
@testable import Space

class LaunchViewModelTests: XCTestCase {

    func testEmptyResponse() throws {
        // given
        let useCaseMock = MockGetLaunchesUseCase(result: [])
        let viewModel = getViewModel(useCase: useCaseMock)

        // when
        let _ = viewModel.fetchData().toBlocking().materialize()
        
        // then
        expect(0).to(equal(viewModel.launches.value.count))
    }
    
    func testErrorResponse() throws {
        // given
        let error = MapperError.emptyValue(value: "")
        let useCaseMock = MockGetLaunchesUseCase(error: error)
        let viewModel = getViewModel(useCase: useCaseMock)

        // when
        let _ = viewModel.fetchData().toBlocking().materialize()
        
        // then
        expect(0).to(equal(viewModel.launches.value.count))
    }
    
    func testOnListResult() throws {
        // given
        let launches = [LaunchMock.random(), LaunchMock.random(), LaunchMock.random(), LaunchMock.random(), LaunchMock.random()]
        let useCaseMock = MockGetLaunchesUseCase(result: launches)
        let viewModel = getViewModel(useCase: useCaseMock)

        // when
        let _ = viewModel.fetchData().toBlocking().materialize()
        
        // then
        expect(launches.count).to(equal(viewModel.launches.value.count))
    }
    
    private func getViewModel(useCase: GetLaunchesUseCaseable) -> LaunchesViewModelable {
        return LaunchesViewModel(getLaunchesUseCase: useCase)
    }
}
