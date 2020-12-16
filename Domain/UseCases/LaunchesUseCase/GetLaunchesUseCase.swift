//
//  GetLaunchesUseCase.swift
//  Domain
//
//  Created by Mateusz Sawa on 13/12/2020.
//

import Foundation
import RxSwift
import NetworkPlatform
import DatabasePlatform

public protocol GetLaunchesUseCaseable {
    func execute() -> Single<[Launch]>
}

public class GetLaunchesUseCase: GetLaunchesUseCaseable {
    private let networkProvider: NetworkProviderable
    private let launchRepository: LaunchRepositorable
    
    public init(_ networkProvider: NetworkProviderable, _ launchRepository: LaunchRepositorable) {
        self.networkProvider = networkProvider
        self.launchRepository = launchRepository
    }
    
    public func execute() -> Single<[Launch]> {
        return networkProvider.getLaunches().flatMap { elements -> Single<[LaunchEntity]> in
            let request = elements.map { try! $0.toLaunchEntity() }.map { self.launchRepository.save(entity: $0) }
            return Single.zip(request)
        }
        .catchError { _ in self.launchRepository.getAll() }
        .map { elements in elements.map { $0.toLaunch() } }
    }
}
