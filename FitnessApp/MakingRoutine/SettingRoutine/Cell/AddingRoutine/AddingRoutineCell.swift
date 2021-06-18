//
//  AddingRoutineCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/12.
//

import UIKit

class AddingRoutineCell: UICollectionViewCell {
    var viewModel: AddingRoutineCellViewModel?

    @IBAction func tappedAddNewRoutineButton(_ sender: Any) {
        self.viewModel?.addRoutine()
    }
    
    @IBAction func tappedAddSavedRoutineButton(_ sender: Any) {
        
    }
}
