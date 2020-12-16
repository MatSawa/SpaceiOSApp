//
//  BaseRouter.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//
import Swinject

protocol Dismissable {
    func dismiss()
}

class BaseFlow: Dismissable {
    let resolver: Resolver
    var rootViewController: UINavigationController = {
        var navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }()

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func dismiss() {
        rootViewController.popViewController(animated: true)
    }
}
