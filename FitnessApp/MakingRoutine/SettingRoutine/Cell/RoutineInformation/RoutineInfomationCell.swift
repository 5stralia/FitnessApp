//
//  RoutineInfomationCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/05.
//

import UIKit

class RoutineInfomationCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: RoutineInfomationCellViewModel? {
        didSet {
            self.bindViewModel()
        }
    }

    private let cellIdentifier = "RoutineInformationPartCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib(nibName: self.cellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.cellIdentifier)
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.didUpdateTitle = { title in
            self.titleLabel.text = title
        }
        viewModel.didUpdateSelectedParts = { [unowned self] in
            self.collectionView.reloadData()
        }
    }
    
}

extension RoutineInfomationCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! RoutineInformationPartCell
        cell.viewModel = self.viewModel?.items[indexPath.row]
        
        return cell
    }
}

extension RoutineInfomationCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         if let title = self.viewModel?.title(indexPath.row),
           let tagTitle = ("#" + title) as NSString? {
            let textWidth = tagTitle.size(withAttributes: [.font: UIFont.systemFont(ofSize: 12, weight: .medium)]).width
            return CGSize(width: ceil(textWidth), height: 24)
        } else {
            return .zero
        }
    }
}
