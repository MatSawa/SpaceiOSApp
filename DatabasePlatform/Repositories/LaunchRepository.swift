//
//  LaunchRepository.swift
//  DatabasePlatform
//
//  Created by Mateusz Sawa on 13/12/2020.
//

import Foundation
import RxSwift

public protocol LaunchRepositorable {
    func save(entity: LaunchEntity) -> Single<LaunchEntity>
    func getAll() -> Single<[LaunchEntity]>
}

public class LaunchRepository: Repository<LaunchEntity>, LaunchRepositorable {
}
