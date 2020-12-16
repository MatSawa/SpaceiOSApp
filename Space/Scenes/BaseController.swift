//
//  BaseController.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import UIKit
import RxSwift

class BaseController<T: UIView, Z: Any>: UIViewController {
    let mainView: T
    let viewModel: Z
    let disposeBag = DisposeBag()

    init(view: T, viewModel: Z) {
        self.mainView = view
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainView
    }
}
