//
//  SelectingPartItemCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/05.
//

import UIKit

class SelectingPartItemCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if oldValue {
                self.containerView.backgroundColor = .systemBackground
                self.titleLabel.textColor = .gray600
            } else {
                self.containerView.backgroundColor = .gray600
                self.titleLabel.textColor = .white
            }
        }
    }

    func set(title: String) {
        self.titleLabel.text = title
    }
}
