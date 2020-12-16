//
//  NetworkAssembly.swift
//  Space
//
//  Created by Mateusz Sawa on 13/12/2020.
//

import Foundation
import Swinject
import NetworkPlatform

public class NetworkAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(JSONDecoder.self) { _ in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(.iso8601)
            return decoder
        }
        
        container.register(Network.self) { resolver in
            let url = resolver.resolve(Bundlerable.self)!.apiUrl
            let decoder = resolver.resolve(JSONDecoder.self)!
            let scheduler = resolver.resolve(SchedulerProviderable.self)!.comptutation()
            return Network(url, decoder, scheduler)
        }.inObjectScope(.container)
        
        container.register(NetworkProviderable.self) { resolver in
            let network = resolver.resolve(Network.self)!
            return NetworkProvider(network)
        }.inObjectScope(.container)
    }
}

fileprivate extension Formatter {
    private static let isoDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = isoDateFormat
        return formatter
    }()
}
