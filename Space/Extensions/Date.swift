//
//  Date.swift
//  Space
//
//  Created by Mateusz Sawa on 16/12/2020.
//

import Foundation
import SwiftDate

public enum DateTimeFormat: String {
    case date = "dd.MM.yyyy"
}

extension Date {
    func toFormat(format: DateTimeFormat) -> String {
        return self.toFormat(format.rawValue)
    }
}
