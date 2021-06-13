//
//  RoutineItemCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/05.
//

import UIKit

class RoutineItemCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    
    var viewModel: MakingRoutineViewModel?
    
    var routineIndex: Int?
    var routineItemIndex: Int?
    
    func set(title: String, weight: Int, count: Int) {
        self.titleLabel.text = title
        self.weightTextField.text = String(weight)
        self.countTextField.text = String(count)
    }
    
    @IBAction func didChangeWeight(_ textField: UITextField) {
        if let routineIndex = self.routineIndex,
           let itemIndex = self.routineItemIndex,
           let weightString = textField.text,
           let weight = Int(weightString) {
            self.viewModel?.changeWeight(routinedIndex: routineIndex, itemIndex: itemIndex, weight: weight)
        }
    }
    
    @IBAction func didChangeCount(_ textField: UITextField) {
        if let routineIndex = self.routineIndex,
           let itemIndex = self.routineItemIndex,
           let countString = textField.text,
           let count = Int(countString) {
            self.viewModel?.changeCount(routinedIndex: routineIndex, itemIndex: itemIndex, count: count)
        }
    }
}
