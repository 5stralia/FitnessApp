//
//  RoutineInformationPartCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/05.
//

import UIKit

class RoutineInformationPartCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(title: String) {
        self.titleLabel.text = title
    }

}
