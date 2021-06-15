//
//  OrderingRoutineView.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/15.
//

import UIKit

class OrderingRoutineView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let informationCellIdentifier = "RoutineInfomationCell"
    private let orderingCellIdentifier = "OrderingRoutineItemCell"
    
    class func OrderingRoutineView() -> OrderingRoutineView {
        return Bundle.main.loadNibNamed("OrderingRoutineView", owner: nil)!.first as! OrderingRoutineView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib(nibName: self.informationCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.informationCellIdentifier)
        self.collectionView.register(UINib(nibName: self.orderingCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.orderingCellIdentifier)
    }

}

extension OrderingRoutineView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.informationCellIdentifier,
                                                          for: indexPath) as! RoutineInfomationCell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.orderingCellIdentifier,
                                                          for: indexPath) as! OrderingRoutineItemCell
            
            return cell
        }
    }
}

extension OrderingRoutineView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.bounds.width, height: 170)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 200)
        }
    }
}

