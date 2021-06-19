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
    
    var viewModel: OrderingRoutineItemCellViewModel? {
        didSet {
            self.bindViewModel()
        }
    }
    
    private let cellIdentifier = "OrderingRoutineItemSetCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib(nibName: self.cellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.cellIdentifier)
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        self.numberLabel.text = viewModel.number
        self.titleLabel.text = viewModel.title
        self.collectionView.isHidden = viewModel.isHiddenItems
        self.collectionView.reloadData()
    }
    
    @IBAction func tappedArrowButton(_ sender: Any) {
        guard let isHiddenItems = self.viewModel?.isHiddenItems else { return }
        
        if isHiddenItems {
            self.arrowButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            self.collectionView.isHidden = true
        } else {
            self.arrowButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
            self.collectionView.isHidden = false
        }
        
        self.viewModel?.toggle()
    }
}

extension OrderingRoutineItemCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier,
                                                      for: indexPath) as! OrderingRoutineItemSetCell
        cell.viewModel = self.viewModel?.items[indexPath.row]
        
        return cell
    }
}

extension OrderingRoutineItemCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 17)
    }
}
