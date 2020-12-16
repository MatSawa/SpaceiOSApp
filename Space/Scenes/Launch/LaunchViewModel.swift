//
//  LaunchViewModel.swift
//  Space
//
//  Created by Mateusz Sawa on 16/12/2020.
//

import Foundation
import Domain
import RxSwift
import RxCocoa

protocol LaunchViewModelable {
    var title: BehaviorRelay<String> { get }
    var description: BehaviorRelay<String> { get }
    var imageUrl: BehaviorRelay<String> { get }
}

class LaunchViewModel: LaunchViewModelable {
    var title: BehaviorRelay<String>
    var description: BehaviorRelay<String>
    var imageUrl: BehaviorRelay<String>

    init(launch: Launch) {
        self.title = .init(value: R.string.localizable.launchTitle(launch.name, launch.date.toFormat(format: .date)))
        self.description = .init(value: launch.description)
        self.imageUrl = .init(value: launch.imageUrl)
    }
}
