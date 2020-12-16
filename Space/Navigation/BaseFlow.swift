//
//  BaseRouter.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//
import Swinject

class BaseFlow {
    let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }
}
