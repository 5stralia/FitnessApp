//
//  OrderingRoutineItemSetCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/15.
//

import UIKit

class OrderingRoutineItemSetCell: UICollectionViewCell {
    @IBOutlet weak var setLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func set(setCount: Int, weight: Int, count: Int) {
        self.setLabel.text = "\(setCount) SET"
        self.weightLabel.text = String(weight)
        self.countLabel.text = String(count)
    }

}
