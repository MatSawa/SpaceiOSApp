//
//  Repository.swift
//  DatabasePlatform
//
//  Created by Mateusz Sawa on 13/12/2020.
//

import Foundation
import Realm
import RealmSwift
import RxSwift
import RxRealm

public class Repository<T: Object> {
    private let realm: Realm
    private let scheduler: ImmediateSchedulerType
    
    public init(_ realm: Realm,_ scheduler: ImmediateSchedulerType) {
        self.realm = realm
        self.scheduler = scheduler
    }
    
    public func getAll() -> Single<[T]> {
        return Single.deferred {
            let objects = self.realm.objects(T.self)
            return .just(objects.toArray())
        }.subscribeOn(scheduler)
    }
    
    public func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> Single<[T]> {
        return Single.deferred {
            let objects = self.realm.objects(T.self)
                .filter(predicate)
                .sorted(by: sortDescriptors.map(SortDescriptor.init))
            
            return .just(objects.toArray())
        }.subscribeOn(scheduler)
    }
    
    public func save(entity: T) -> Single<T> {
        return Single.deferred {
            return self.realm.rx.save(entity: entity)
        }.subscribeOn(scheduler)
    }
    
    public func delete(primaryKey: String) -> Completable {
        return Completable.deferred {
            return self.realm.rx.delete(primaryKey: primaryKey)
        }.subscribeOn(scheduler)
    }
}
