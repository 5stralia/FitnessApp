//
//  SelectingPartView.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/04.
//

import UIKit

class SelectingPartView: UIView {

    class func SelectingPartView() -> SelectingPartView {
        return Bundle.main.loadNibNamed("SelectingPartView", owner: nil)!.first as! SelectingPartView
    }

}
