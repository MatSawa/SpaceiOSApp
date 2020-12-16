//
//  UIFont.swift
//  Space
//
//  Created by Mateusz Sawa on 16/12/2020.
//
import UIKit

extension UIFont {
    class func regular(weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: 14.adjusted, weight: weight)
    }
    class func title(weight: UIFont.Weight = .medium) -> UIFont {
        return UIFont.systemFont(ofSize: 16.adjusted, weight: weight)
    }
}
