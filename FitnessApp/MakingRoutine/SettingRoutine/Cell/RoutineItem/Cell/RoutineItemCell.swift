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
    
    var viewModel: RoutineItemCellViewModel? {
        didSet {
            self.bindViewModel()
        }
    }
    
    var routineIndex: Int?
    var routineItemIndex: Int?
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        self.titleLabel.text = viewModel.setCount
        self.weightTextField.text = viewModel.weight
        self.countTextField.text = viewModel.count
    }
    
    @IBAction func didChangeWeight(_ textField: UITextField) {
        if let weightString = textField.text,
           let weight = Int(weightString) {
            self.viewModel?.change(weight: weight)
        }
    }
    
    @IBAction func didChangeCount(_ textField: UITextField) {
        if let countString = textField.text,
           let count = Int(countString) {
            self.viewModel?.change(count: count)
        }
    }
}
