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

protocol AbstractRepository {
    associatedtype T
    func getAll() -> Single<[T]>
    func query(with predicate: NSPredicate,
               sortDescriptors: [NSSortDescriptor]) -> Single<[T]>
    func save(entity: T) -> Completable
    func delete(primaryKey: String) -> Completable
}

public class Repository<T: RealmSwiftObject>: AbstractRepository {
    private let realm: Realm
    private let scheduler: ImmediateSchedulerType
    
    init(_ realm: Realm,_ scheduler: ImmediateSchedulerType) {
        self.realm = realm
        self.scheduler = scheduler
    }
    
    func getAll() -> Single<[T]> {
        return Single.deferred {
            let objects = self.realm.objects(T.self)
            return .just(objects.toArray())
        }.subscribeOn(scheduler)
    }
    
    func query(with predicate: NSPredicate, sortDescriptors: [NSSortDescriptor]) -> Single<[T]> {
        return Single.deferred {
            let objects = self.realm.objects(T.self)
                .filter(predicate)
                .sorted(by: sortDescriptors.map(SortDescriptor.init))
            
            return .just(objects.toArray())
        }.subscribeOn(scheduler)
    }
    
    func save(entity: T) -> Completable {
        return Completable.deferred {
            return self.realm.rx.save(entity: entity)
        }.subscribeOn(scheduler)
    }
    
    func delete(primaryKey: String) -> Completable {
        return Completable.deferred {
            return self.realm.rx.delete(primaryKey: primaryKey)
        }.subscribeOn(scheduler)
    }
}
