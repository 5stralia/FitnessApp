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
    
    private var count = 3
    
    func set(title: String) {
        self.titleLabel.text = title
    }
    
    @IBAction func tappedMinusButton(_ sender: Any) {
        self.count -= 1
        self.countLabel.text = String(self.count)
    }
    
    @IBAction func tappedPlusButton(_ sender: Any) {
        self.count += 1
        self.countLabel.text = String(self.count)
    }
}
