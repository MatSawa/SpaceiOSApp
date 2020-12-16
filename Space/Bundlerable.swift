//
//  Bundlerable.swift
//  Space
//
//  Created by Mateusz Sawa on 13/12/2020.
//
import Foundation

protocol Bundlerable {
    var apiUrl: String { get }
}

class Bundler: Bundlerable {
    private let serverUrlKey = "API_URL"
    private let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    var apiUrl: String {
        return string(forKey: serverUrlKey)
    }
    
    func string(forKey key: String) -> String {
        return bundle.object(forInfoDictionaryKey: key) as? String ?? ""
    }
}
