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
    
    var viewModel: OrderingRoutineItemSetCellViewModel? {
        didSet {
            self.bindViewModel()
        }
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        self.setLabel.text = viewModel.setCount
        self.weightLabel.text = viewModel.weight
        self.countLabel.text = viewModel.count
    }

}
