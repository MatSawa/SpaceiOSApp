//
//  LaunchesController.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class LaunchesController: BaseController<LaunchesView, LaunchesViewModelable> {
    private let flow: MainFlowable

    init(view: LaunchesView, viewModel: LaunchesViewModelable, flow: MainFlowable) {
        self.flow = flow
        super.init(view: view, viewModel: viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        disposeBag.insert([
            viewModel.fetchData().subscribe(),
            viewModel.launches.bind(to: mainView.tableView.rx.items(cellIdentifier: launchTableViewCellIdentifier)) { _, model, cell in
                guard let launchCell = cell as? LaunchTableViewCell else { return }
                launchCell.configure(with: model)
            },
            mainView.tableView.rx.modelSelected(LaunchRowViewModel.self).bind(onNext: { [weak self] viewModel in
                self?.flow.navigate(to: .launch(with: viewModel.launch))
            })
        ])
    }
}
