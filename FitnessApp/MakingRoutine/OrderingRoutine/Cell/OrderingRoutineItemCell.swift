//
//  OrderingRoutineItemCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/15.
//

import UIKit

class OrderingRoutineItemCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellIdentifier = "OrderingRoutineItemSetCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib(nibName: self.cellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.cellIdentifier)
    }

}

extension OrderingRoutineItemCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier,
                                                      for: indexPath) as! OrderingRoutineItemSetCell
        
        return cell
    }
}

extension OrderingRoutineItemCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 17)
    }
}
