//
//  Launch.swift
//  SpaceTests
//
//  Created by Mateusz Sawa on 17/12/2020.
//

import Foundation
import Domain

struct LaunchMock {
    static func random() -> Launch {
        return Launch(id: StringMock.randomString(length: 6), name: StringMock.randomString(length: 6), description: StringMock.randomString(length: 99), imageUrl: StringMock.randomString(length: 5), date: Date())
    }
}
