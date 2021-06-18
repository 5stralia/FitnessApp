//
//  RoutineInformationPartCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/05.
//

import UIKit

class RoutineInformationPartCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: RoutineInformationPartCellViewModel? {
        didSet {
            self.bindViewModel()
        }
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        self.titleLabel.text = "#\(viewModel.title)"
    }

}
