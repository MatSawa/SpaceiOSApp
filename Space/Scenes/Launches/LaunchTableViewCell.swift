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
import Kingfisher
import RxSwift
import Domain
import MaterialComponents.MaterialCards

let launchTableViewCellIdentifier = "launchTableViewCellIdentifier"
class LaunchTableViewCell: UITableViewCell {
    private var disposeBag = DisposeBag()
    private var selectionBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private var container: MDCCard = {
        let cardView = MDCCard()
        cardView.isUserInteractionEnabled = false
        cardView.inkView.isUserInteractionEnabled = false
        cardView.rippleView.isUserInteractionEnabled = false
        cardView.isInteractable = false
        cardView.enableRippleBehavior = false
        cardView.rippleView.rippleColor = .clear
        cardView.inkView.inkColor = .clear
        cardView.backgroundColor = R.color.primaryDarkColor()
        return cardView
    }()

    var iconImageView: UIImageView = {
        return UIImageView()
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.textColor()
        label.font = .title()
        label.numberOfLines = 1
        return label
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = R.color.textColor()
        label.font = .regular()
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
            viewModel.description.bind(to: descriptionLabel.rx.text),
            viewModel.imageUrl.bind(onNext: { [weak iconImageView] (url) in
                iconImageView?.kf.setImage(with: URL(string: url))
            })
        ])
    }

    private func setupView() {
        selectedBackgroundView = selectionBackground
        backgroundColor = .clear
        isAccessibilityElement = true
        accessibilityLabel = "launchCell"
        accessibilityIdentifier = "launchCell"

        contentView.addSubview(container)
        container.snp.makeConstraints { maker in
            maker.top.leading.equalToSuperview().offset(.small)
            maker.bottom.trailing.equalToSuperview().offset(-.small)
        }
        
        container.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { maker in
            maker.leading.top.equalToSuperview().offset(.normal)
            maker.bottom.equalToSuperview().offset(-.normal)
            maker.width.equalToSuperview().dividedBy(4)
            maker.height.equalTo(iconImageView.snp.width)
        }
        
        container.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(iconImageView.snp.trailing).offset(.normal)
            maker.top.equalToSuperview().offset(.normal)
            maker.trailing.equalToSuperview().offset(-.normal)
            maker.height.greaterThanOrEqualTo(21.adjusted)
        }
        
        container.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { maker in
            maker.leading.trailing.equalTo(titleLabel)
            maker.top.equalTo(titleLabel.snp.bottom).offset(.small)
            maker.bottom.lessThanOrEqualToSuperview().offset(-.small)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
