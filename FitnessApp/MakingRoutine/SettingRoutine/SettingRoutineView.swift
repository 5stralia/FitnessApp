//
//  SettingRoutineView.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/05.
//

import UIKit

final class SettingRoutineView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: MakingRoutineViewModel? {
        didSet {
            self.bindViewModel()
        }
    }
    
    private let informationCellIndentifier = "RoutineInfomationCell"
    private let routineItemCellIdentifier = "RoutinePartCell"
    private let addingRoutineCellIdentifier = "AddingRoutineCell"
    
    class func SettingRoutineView() -> SettingRoutineView {
        return Bundle.main.loadNibNamed("SettingRoutineView", owner: nil)!.first as! SettingRoutineView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib(nibName: self.informationCellIndentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.informationCellIndentifier)
        self.collectionView.register(UINib(nibName: self.routineItemCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.routineItemCellIdentifier)
        self.collectionView.register(UINib(nibName: self.addingRoutineCellIdentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.addingRoutineCellIdentifier)
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.didUpdateRoutines = { [unowned self] in
            self.collectionView.reloadData()
        }
        
        viewModel.didUpdateRoutine = { [unowned self] index in
//            self.collectionView.collectionViewLayout.invalidateLayout()
        }
    }

}

extension SettingRoutineView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 + (self.viewModel?.routines.count ?? 0) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.informationCellIndentifier,
                                                          for: indexPath) as! RoutineInfomationCell
            cell.viewModel = self.viewModel
            
            return cell
            
        } else if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.addingRoutineCellIdentifier, for: indexPath) as! AddingRoutineCell
            
            cell.viewModel = self.viewModel
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.routineItemCellIdentifier,
                                                          for: indexPath) as! RoutinePartCell
            cell.routineIndex = indexPath.row - 1
            cell.viewModel = self.viewModel
            
            return cell
        }
    }
}

extension SettingRoutineView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.bounds.width, height: 170)
        } else if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            return CGSize(width: collectionView.bounds.width - 20, height: 53)
        } else if let routine = self.viewModel?.routines[indexPath.row - 1] {
            let height = (routine.items.count * 20)
                + ((routine.items.count > 1 ? routine.items.count - 1 : 0) * 16)
                + 190
            return CGSize(width: collectionView.bounds.width, height: CGFloat(height))
        } else {
            return .zero
        }
    }
}
