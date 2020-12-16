//
//  DatabaseAssembly.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import Swinject
import DatabasePlatform
import RealmSwift

public class DatabaseAssembly: Assembly {
    private let databaseName = "space.db"
    public func assemble(container: Container) {
        container.register(Realm.self) { _ in
            let documentsPath: NSString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
            let realmPath = documentsPath.appendingPathComponent(self.databaseName)
            var configuration = Realm.Configuration.defaultConfiguration
            configuration.fileURL = NSURL(fileURLWithPath: realmPath) as URL
            // swiftlint:disable force_try
            return try! Realm(configuration: configuration)
            // swiftlint:enable force_try
        }.inObjectScope(.container)

        container.register(LaunchRepositorable.self) { resolver in
            let realm = resolver.resolve(Realm.self)!
            let scheduler = resolver.resolve(SchedulerProviderable.self)!.main()

            return LaunchRepository(realm, scheduler)
        }.inObjectScope(.container)
    }
}
