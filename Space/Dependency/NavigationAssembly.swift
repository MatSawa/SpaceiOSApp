//
//  NavigationAssembly.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import Swinject
import Domain
import NetworkPlatform
import DatabasePlatform

public class NavigationAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(MainFlowable.self) { resolver in
            return MainFlow(resolver: resolver)
        }.inObjectScope(.container)
    }
}
