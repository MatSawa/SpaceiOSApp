//
//  Adjusted.swift
//  Space
//
//  Created by Mateusz Sawa on 15/12/2020.
//

import Foundation
import UIKit

private class Device {
    //Iphone 11 width
    private static let base: CGFloat = 414
    
    static var ratio: CGFloat {
        return UIScreen.main.bounds.width / base
    }
}

extension CGFloat {
    var adjusted: CGFloat {
        return self * Device.ratio
    }
}

extension Double {
    var adjusted: CGFloat {
        return CGFloat(self) * Device.ratio
    }
}

extension Int {
    var adjusted: CGFloat {
        return CGFloat(self) * Device.ratio
    }
}
