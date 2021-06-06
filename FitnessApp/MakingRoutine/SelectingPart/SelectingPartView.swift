//
//  SelectingPartView.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/04.
//

import UIKit

class SelectingPartView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: MakingRoutineViewModel? {
        didSet {
            self.bindViewModel()
        }
    }
    
    private let cellIndentifier = "SelectingPartItemCell"
    
    class func SelectingPartView() -> SelectingPartView {
        return Bundle.main.loadNibNamed("SelectingPartView", owner: nil)!.first as! SelectingPartView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout = UICollectionViewLeftAlignedFlowLayout()
        layout.scrollDirection = .vertical
        
        self.collectionView.collectionViewLayout = layout
        
        self.collectionView.register(UINib(nibName: self.cellIndentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.cellIndentifier)
        
        self.collectionView.allowsMultipleSelection = true
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        self.collectionView.reloadData()
    }

}

extension SelectingPartView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.viewModel?.parts.count ?? 0) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIndentifier, for: indexPath) as! SelectingPartItemCell
        
        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            cell.set(title: "+")
        } else {
            cell.set(title: self.viewModel?.parts[indexPath.row] ?? "")
        }
        
        return cell
    }
}

extension SelectingPartView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            let textWidth = "+".size(withAttributes: [.font: UIFont.systemFont(ofSize: 12, weight: .medium)]).width
            return CGSize(width: 8 + ceil(textWidth) + 8, height: 24)
            
        } else if let title = self.viewModel?.parts[indexPath.row] as NSString? {
            let textWidth = title.size(withAttributes: [.font: UIFont.systemFont(ofSize: 12, weight: .medium)]).width
            return CGSize(width: 8 + ceil(textWidth) + 8, height: 24)
            
        } else {
            return .zero
        }
    }
}

extension SelectingPartView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            print("운동 부위 추가 버튼 선택됨")
            
            return false
        } else {
            return true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewModel?.selectPart(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        self.viewModel?.deselectPart(indexPath.row)
    }
}
