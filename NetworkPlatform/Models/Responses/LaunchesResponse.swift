//
//  LaunchesResponse.swift
//  NetworkPlatform
//
//  Created by Mateusz Sawa on 12/12/2020.
//

import Foundation

// MARK: - LaunchResponse
public struct LaunchResponse: Codable {
    public let links: Links?
    public let details: String?
    public let launchpad: String?
    public let flightNumber: Int?
    public let name: String?
    public let date: Date?
    public let id: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, flightNumber, launchpad, details, links
        case date = "date_utc"
    }
}

// MARK: - Links
public struct Links: Codable {
    public let patch: Patch?

    enum CodingKeys: String, CodingKey {
        case patch
    }
}

// MARK: - Patch
public struct Patch: Codable {
    public let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "small"
    }
}
