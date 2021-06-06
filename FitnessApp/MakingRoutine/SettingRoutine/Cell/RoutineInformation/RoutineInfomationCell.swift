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
    
    var viewModel: MakingRoutineViewModel? {
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
        return self.viewModel?.selectedParts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! RoutineInformationPartCell
        
        if let selectedIndex = self.viewModel?.selectedParts[indexPath.row],
           let title = self.viewModel?.parts[selectedIndex] {
            cell.set(title: title)
        }
        
        return cell
    }
}

extension RoutineInfomationCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let selectedIndex = self.viewModel?.selectedParts[indexPath.row],
           let title = self.viewModel?.parts[selectedIndex] as NSString? {
            let textWidth = title.size(withAttributes: [.font: UIFont.systemFont(ofSize: 12, weight: .medium)]).width
            return CGSize(width: 8 + ceil(textWidth) + 8, height: 24)
        } else {
            return .zero
        }
    }
}