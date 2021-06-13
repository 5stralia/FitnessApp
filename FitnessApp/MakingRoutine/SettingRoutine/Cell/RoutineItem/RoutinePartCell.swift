//
//  RoutinePartCell.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/05.
//

import UIKit

class RoutinePartCell: UICollectionViewCell {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: MakingRoutineViewModel? {
        didSet {
            if let routineIndex = self.routineIndex {
                self.titleTextField.text = viewModel?.routines[routineIndex].titie
            }
            self.collectionView.reloadData()
        }
    }
    
    var routineIndex: Int?
    var routine: Routine?
    
    private let cellIndentifier = "RoutineItemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib(nibName: self.cellIndentifier, bundle: nil),
                                     forCellWithReuseIdentifier: self.cellIndentifier)
    }

    @IBAction func tappedAddButton(_ sender: Any) {
        if let routineIndex = self.routineIndex {
            self.viewModel?.addRoutinePart(routineIndex)
        }
    }
    
    @IBAction func didChange(_ textField: UITextField) {
        if let title = textField.text,
           let routineIndex = self.routineIndex {
            self.viewModel?.changeTitle(routineIndex, title: title)
        }
    }
}

extension RoutinePartCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let routineIndex = self.routineIndex else { return 0 }
        return self.viewModel?.routines[routineIndex].items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIndentifier, for: indexPath) as! RoutineItemCell
        
        if let routineIndex = self.routineIndex,
           let item = self.viewModel?.routines[routineIndex].items[indexPath.row] {
            cell.set(title: item.title,weight: item.weight, count: item.count)
            cell.viewModel = self.viewModel
            cell.routineIndex = self.routineIndex
            cell.routineItemIndex = indexPath.row
        }
        
        return cell
    }
}

extension RoutinePartCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 20)
    }
}

extension RoutinePartCell: UITextFieldDelegate {
    
}
