//
//  Launch.swift
//  Domain
//
//  Created by Mateusz Sawa on 13/12/2020.
//

import Foundation

public struct Launch {
    public let id: String
    public let name: String
    public let description: String
    public let imageUrl: String
    public let date: Date
    
    public init(id: String, name: String, description: String, imageUrl: String, date: Date) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.date = date
    }
}
