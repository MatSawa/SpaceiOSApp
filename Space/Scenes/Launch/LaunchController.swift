//
//  LaunchController.swift
//  Space
//
//  Created by Mateusz Sawa on 16/12/2020.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit
import Kingfisher

class LaunchController: BaseController<LaunchView, LaunchViewModelable> {
    private let flow: MainFlowable
    
    init(view: LaunchView, viewModel: LaunchViewModelable, flow: MainFlowable) {
        self.flow = flow
        super.init(view: view, viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disposeBag.insert([
            mainView.backButton.rx.tap.bind { [unowned self] in
                self.flow.dismiss()
            },
            viewModel.title.bind(to: mainView.titleLabel.rx.text),
            viewModel.description.bind(to: mainView.descriptionTextView.rx.text),
            viewModel.imageUrl.bind(onNext: { [weak mainView] (url) in
                mainView?.iconImageView.kf.setImage(with: URL(string: url))
            })
        ])
    }
}
