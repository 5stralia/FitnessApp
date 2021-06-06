//
//  RoutineItemCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/05.
//

import UIKit

class RoutineItemCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var viewModel: MakingRoutineViewModel?
    
    var routineIndex: Int?
    var routineItemIndex: Int?
    
    func set(title: String, count: Int) {
        self.titleLabel.text = title
        self.countLabel.text = String(count)
    }
    
    @IBAction func tappedMinusButton(_ sender: Any) {
        if let routineIndex = self.routineIndex,
           let itemIndex = self.routineItemIndex {
            self.viewModel?.subCount(routineIndex: routineIndex, itemIndex: itemIndex)
        }
        
    }
    
    @IBAction func tappedPlusButton(_ sender: Any) {
        if let routineIndex = self.routineIndex,
           let itemIndex = self.routineItemIndex {
            self.viewModel?.addCount(routineIndex: routineIndex, itemIndex: itemIndex)
        }
    }
}
