//
//  LaunchesView.swift
//  Space
//
//  Created by Mateusz Sawa on 14/12/2020.
//

import Foundation
import UIKit

class LaunchesView: UIView {
    var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = UITableView.automaticDimension
        table.register(LaunchTableViewCell.self, forCellReuseIdentifier: launchTableViewCellIdentifier)
        table.separatorColor = .clear
        table.backgroundColor = .clear
        table.accessibilityLabel = "launchesTable"
        table.accessibilityIdentifier = "launchesTable"
        table.showsVerticalScrollIndicator = false
        return table
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = R.color.primaryColor()
        
        addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}
