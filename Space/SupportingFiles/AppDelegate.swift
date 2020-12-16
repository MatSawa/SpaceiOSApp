//
//  AppDelegate.swift
//  Space
//
//  Created by Mateusz Sawa on 11/12/2020.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private let assemblers = Swinject.Assembler([
        NetworkAssembly(),
        ToolsAssembly(),
        DatabaseAssembly(),
        UseCaseAssembly(),
        ScenesAssembly(),
        NavigationAssembly()
    ])

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainFlow = assemblers.resolver.resolve(MainFlowable.self)
        window = UIWindow()
        window?.rootViewController = mainFlow?.rootViewController
        window?.makeKeyAndVisible()
        mainFlow?.navigate(to: .start)
        return true
    }
}
