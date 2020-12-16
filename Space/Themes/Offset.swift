//
//  Offset.swift
//  Space
//
//  Created by Mateusz Sawa on 12/12/2020.
//

import Foundation
import SnapKit

enum Offset: CGFloat {
    case small = 7
    case normal = 15
    
    static prefix func - (offset: Offset) -> CGFloat {
        return -offset.rawValue.adjusted
    }
}

extension ConstraintMakerEditable {
    @discardableResult
    func offset(_ offset: Offset) -> ConstraintMakerEditable {
        self.offset(offset.rawValue.adjusted)
    }
}
