//
//  UseCaseAssembly.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import Swinject
import Domain
import NetworkPlatform
import DatabasePlatform

public class UseCaseAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(GetLaunchesUseCaseable.self) { resolver in
            let network = resolver.resolve(NetworkProviderable.self)!
            let launchRepository = resolver.resolve(LaunchRepositorable.self)!
            
            return GetLaunchesUseCase(network, launchRepository)
        }
    }
}
