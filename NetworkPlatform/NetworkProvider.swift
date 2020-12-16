//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by Mateusz Sawa on 12/12/2020.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

fileprivate enum EndPoint: String {
    case launches = "v4/launches"
}

public protocol NetworkProviderable {
    func getLaunches() -> Single<[LaunchResponse]>
}

public class NetworkProvider: NetworkProviderable {
    private let network: Network
    
    public init(_ network: Network) {
        self.network = network
    }
    
    public func getLaunches() -> Single<[LaunchResponse]> {
        network.get(EndPoint.launches.rawValue)
    }
}
