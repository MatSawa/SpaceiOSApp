//
//  Realm.swift
//  DatabasePlatform
//
//  Created by Mateusz Sawa on 13/12/2020.
//

import Foundation
import Realm
import RealmSwift
import RxSwift

internal extension SortDescriptor {
    init(sortDescriptor: NSSortDescriptor) {
        self.init(keyPath: sortDescriptor.key ?? "", ascending: sortDescriptor.ascending)
    }
}

internal extension Reactive where Base == Realm {
    func save<T: Object>(entity: T) -> Single<T>  {
        return Single.create { emitter in
            do {
                try self.base.write {
                    self.base.add(entity, update: .all)
                }
                emitter(.success(entity))
            } catch {
                emitter(.error(error))
            }
            return Disposables.create()
        }
    }
    
    func delete<T: Object>(primaryKey: Any, type: T.Type = T.self) -> Completable  {
        return Completable.create { completable in
            do {
                guard let object = self.base.object(ofType: type, forPrimaryKey: primaryKey) else { fatalError() }

                try self.base.write {
                    self.base.delete(object)
                }
                completable(.completed)
            } catch {
                completable(.error(error))
            }
            return Disposables.create()
        }
    }
}
