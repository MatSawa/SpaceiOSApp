//
//  LaunchView.swift
//  Space
//
//  Created by Mateusz Sawa on 16/12/2020.
//

import Foundation
import UIKit
import MaterialComponents.MDCCard

class LaunchView: UIView {
    private var topContainer: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.secondaryColor()
        return view
    }()
    
    var backButton: UIButton = {
        var button = UIButton()
        button.tintColor = R.color.primaryDarkColor()
        button.setImage(R.image.arrowBack(), for: .normal)
        return button
    }()
    
    var iconImageView: UIImageView = {
        var imageView = CircleImageView()
        imageView.contentMode = .center
        imageView.backgroundColor = R.color.primaryColor()
        return imageView
    }()
    
    private var container: MDCCard = {
        let cardView = MDCCard()
        cardView.backgroundColor = R.color.primaryDarkColor()
        return cardView
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.font = .title()
        label.numberOfLines = 2
        label.textColor = R.color.textColor()
        return label
    }()

    var descriptionTextView: UITextView = {
        var textView = UITextView()
        textView.font = .regular()
        textView.contentInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        textView.backgroundColor = .clear
        textView.textColor = R.color.textColor()
        textView.isUserInteractionEnabled = false
        return textView
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
        
        addSubview(topContainer)
        topContainer.snp.makeConstraints { maker in
            maker.leading.top.trailing.equalToSuperview()
            maker.height.equalToSuperview().dividedBy(3)
        }
        
        topContainer.addSubview(backButton)
        backButton.snp.makeConstraints { maker in
            maker.top.equalTo(safeAreaLayoutGuide.snp.top)
            maker.leading.equalToSuperview().offset(.normal)
        }
        
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalTo(topContainer.snp.centerY)
            maker.height.equalTo(topContainer.snp.height).multipliedBy(0.6)
            maker.width.equalTo(iconImageView.snp.height)
        }
        
        addSubview(container)
        container.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(.normal)
            maker.trailing.equalToSuperview().offset(-.normal)
            maker.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-.normal)
            maker.top.equalTo(iconImageView.snp.bottom).offset(.normal)
        }
        
        container.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.leading.top.equalToSuperview().offset(.normal)
            maker.trailing.equalToSuperview().offset(-.normal)
        }
        
        container.addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(.normal)
            maker.leading.trailing.equalTo(titleLabel)
            maker.bottom.equalToSuperview().offset(-.normal)
        }
    }
}
