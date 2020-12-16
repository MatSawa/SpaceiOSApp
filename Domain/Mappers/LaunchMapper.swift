//
//  LaunchMapper.swift
//  Domain
//
//  Created by Mateusz Sawa on 15/12/2020.
//

import Foundation
import NetworkPlatform
import DatabasePlatform

public extension LaunchResponse {
    func toLaunchEntity() throws -> LaunchEntity {
        guard let id = self.id else {
            throw MapperError.emptyValue(value: "ID == NIL")
        }
        
        return LaunchEntity(id: id, name: name ?? "", imageUrl: links?.patch?.imageUrl ?? "",
                            details: details ?? "", date: date ?? Date())
    }
}

public extension LaunchEntity {
    func toLaunch() -> Launch {
        return .init(id: id, name: name, description: details, imageUrl: imageUrl, date: date)
    }
}
