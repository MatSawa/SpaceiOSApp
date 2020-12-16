//
//  CircleImageView.swift
//  Space
//
//  Created by Mateusz Sawa on 16/12/2020.
//

import Foundation
import UIKit

class CircleImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
}
