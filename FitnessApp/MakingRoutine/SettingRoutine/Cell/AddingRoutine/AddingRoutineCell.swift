//
//  AddingRoutineCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/12.
//

import UIKit

class AddingRoutineCell: UICollectionViewCell {
    var viewModel: MakingRoutineViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func tappedAddNewRoutineButton(_ sender: Any) {
        self.viewModel?.addRoutine()
    }
    
    @IBAction func tappedAddSavedRoutineButton(_ sender: Any) {
        
    }
}
