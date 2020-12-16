//
//  LaunchesTableViewCell.swift
//  Space
//
//  Created by Mateusz Sawa on 15/12/2020.
//

import Foundation
import SnapKit
import UIKit
import RxCocoa
import RxSwift
import Domain

let launcheTableViewCellIdentifier = "launcheTableViewCellIdentifier"
class LaunchTableViewCell: UITableViewCell {
    private var disposeBag = DisposeBag()
    private var selectionBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var textContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = Offset.small.rawValue.adjusted
        return stackView
    }()
    
    var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    func configure(with viewModel: LaunchRowViewModel) {
        disposeBag.insert([
            viewModel.title.bind(to: titleLabel.rx.text),
            viewModel.description.bind(to: titleLabel.rx.text)
        ])
    }
    
    private func setupView() {
        selectedBackgroundView = selectionBackground
        isAccessibilityElement = true
        accessibilityLabel = "launchCell"
        accessibilityIdentifier = "launchCell"
        
        //        backgroundColor = .solitude
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { maker in
            maker.leading.top.equalToSuperview().offset(.normal)
            maker.bottom.equalToSuperview().offset(-.normal)
            maker.width.equalToSuperview().dividedBy(4)
            maker.height.equalTo(iconImageView.snp.width)
        }
        contentView.addSubview(textContainer)
        textContainer.snp.makeConstraints { maker in
            maker.leading.equalTo(iconImageView.snp.trailing).offset(.normal)
            maker.top.equalTo(iconImageView.snp.top)
            maker.trailing.bottom.equalToSuperview().offset(-.normal)
        }
        textContainer.addArrangedSubview(titleLabel)
        textContainer.addArrangedSubview(descriptionLabel)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
