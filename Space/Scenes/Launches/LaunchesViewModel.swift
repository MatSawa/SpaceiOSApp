//
//  LaunchesViewModel.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

protocol LaunchesViewModelable {
    var isLoading: BehaviorRelay<Bool> { get }
    var launches: BehaviorRelay<[LaunchRowViewModel]> { get }
    func fetchData() -> Completable
}

class LaunchesViewModel: LaunchesViewModelable {
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var launches: BehaviorRelay<[LaunchRowViewModel]> = .init(value: [])

    private let getLaunchesUseCase: GetLaunchesUseCaseable
    
    init(getLaunchesUseCase: GetLaunchesUseCaseable) {
        self.getLaunchesUseCase = getLaunchesUseCase
    }
    
    func fetchData() -> Completable {
        isLoading.accept(true)
        return getLaunchesUseCase.execute()
            .map({ launches -> [LaunchRowViewModel] in
                launches.map { LaunchRowViewModel(launch: $0)}
            })
            .do(onSuccess: { [weak self] viewModels in
                guard let self = self else { return }
                self.isLoading.accept(false)
                self.launches.accept(viewModels)
            }, onError: { [weak isLoading] _ in
                isLoading?.accept(false)
            }).asCompletable()
    }
}
