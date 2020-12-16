//
//  Network.swift
//  NetworkPlatform
//
//  Created by Mateusz Sawa on 12/12/2020.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

public final class Network {
    private let url: String
    private let jsonDecoder: JSONDecoder
    private let scheduler: ImmediateSchedulerType
    
    public init(_ url: String, _ jsonDecoder: JSONDecoder, _ scheduler: ImmediateSchedulerType) {
        self.url = url
        self.jsonDecoder = jsonDecoder
        self.scheduler = scheduler
    }
    
    public func get<T: Decodable>(_ path: String) -> Single<[T]> {
        let absolutePath = "\(url)/\(path)"
        return RxAlamofire
            .data(.get, absolutePath)
            .debug()
            .observeOn(scheduler)
            .map({ data -> [T] in
                return try self.jsonDecoder.decode([T].self, from: data)
            }).asSingle()
    }
}
