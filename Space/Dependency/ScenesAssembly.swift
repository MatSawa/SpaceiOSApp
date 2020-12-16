//
//  ScenesAssembly.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import Swinject
import Domain

public class ScenesAssembly: Assembly {
    public func assemble(container: Container) {
        registerLaunchesScene(container: container)
        registerLaunchScene(container: container)
    }
    
    // MARK: Launches Scene
    private func registerLaunchesScene(container: Container) {
        container.register(LaunchesView.self) { _ in
            return LaunchesView()
        }
        
        container.register(LaunchesViewModelable.self) { resolver in
            let useCase = resolver.resolve(GetLaunchesUseCaseable.self)!
            return LaunchesViewModel(getLaunchesUseCase: useCase)
        }
        
        container.register(LaunchesController.self) { resolver in
            let viewModel = resolver.resolve(LaunchesViewModelable.self)!
            let view = resolver.resolve(LaunchesView.self)!
            let flow = resolver.resolve(MainFlowable.self)!
            
            return LaunchesController(view: view, viewModel: viewModel, flow: flow)
        }
    }
    
    // MARK: Launch Scene
    private func registerLaunchScene(container: Container) {
        container.register(LaunchView.self) { _ in
            return LaunchView()
        }
        
        container.register(LaunchViewModelable.self) { (_, launch: Launch) in
            return LaunchViewModel(launch: launch)
        }
        
        container.register(LaunchController.self) { (resolver, launch: Launch) in
            let viewModel = resolver.resolve(LaunchViewModelable.self, argument: launch)!
            let view = resolver.resolve(LaunchView.self)!
            let flow = resolver.resolve(MainFlowable.self)!
            
            return LaunchController(view: view, viewModel: viewModel, flow: flow)
        }
    }
}
