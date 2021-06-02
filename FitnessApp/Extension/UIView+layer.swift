//
//  UIView+layer.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/02.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            self.layer.cornerRadius
        }
    }
}
