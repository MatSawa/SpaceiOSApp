//
//  MapperError.swift
//  Domain
//
//  Created by Mateusz Sawa on 15/12/2020.
//

import Foundation

public enum MapperError: Error {
    case emptyValue(value: String)
}
