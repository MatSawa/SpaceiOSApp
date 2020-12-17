//
//  StringMock.swift
//  SpaceTests
//
//  Created by Mateusz Sawa on 17/12/2020.
//

import Foundation

struct StringMock {
    private static let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    static func randomString(length: Int) -> String {
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
