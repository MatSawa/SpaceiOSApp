//
//  ToolsAssembly.swift
//  Space
//
//  Created by Mateusz Sawa on 13/12/2020.
//

import Foundation
import Swinject

public class ToolsAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(Bundle.self) { _ in
            return Bundle.main
        }

        container.register(Bundlerable.self) { resolver in
            return Bundler(bundle: resolver.resolve(Bundle.self)!)
        }

        container.register(SchedulerProviderable.self, factory: { _ in
            return SchedulerProvider()
        })
    }
}
