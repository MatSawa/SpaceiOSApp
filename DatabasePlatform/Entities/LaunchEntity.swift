//
//  LaunchEntity.swift
//  DatabasePlatform
//
//  Created by Mateusz Sawa on 12/12/2020.
//

import Foundation
import RealmSwift
import Realm

public class LaunchEntity: Object {
    @objc public dynamic var id: String = ""
    @objc public dynamic var name: String = ""
    @objc public dynamic var imageUrl: String = ""
    @objc public dynamic var details: String = ""
    @objc public dynamic var date: Date = Date(timeIntervalSince1970: 1)
    
    public init(id: String, name: String, imageUrl: String, details: String, date: Date) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.details = details
        self.date = date
    }
    
    public override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        return "id"
    }
}
