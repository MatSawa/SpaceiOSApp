//
//  LaunchRowViewModel.swift
//  Space
//
//  Created by Mateusz Sawa on 15/12/2020.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

class LaunchRowViewModel {
    let title: BehaviorRelay<String>
    let description: BehaviorRelay<String>
    let imageUrl: BehaviorRelay<String>
    let launch: Launch

    init(launch: Launch) {
        self.launch = launch
        self.title = .init(value: launch.name)
        self.description = .init(value: launch.description)
        self.imageUrl = .init(value: launch.imageUrl)
    }
}
