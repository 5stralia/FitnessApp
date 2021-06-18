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
    
    var viewModel: RoutinePartCellViewModel? {
        didSet {
            self.bindViewModel()
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
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.didUpdateItems = { [unowned self] in
            self.collectionView.reloadData()
        }
        
        self.titleTextField.text = viewModel.title
        self.collectionView.reloadData()
    }

    @IBAction func tappedAddButton(_ sender: Any) {
        self.viewModel?.addRoutinePart()
    }
    
    @IBAction func didChange(_ textField: UITextField) {
        if let title = textField.text {
            self.viewModel?.change(title: title)
        }
    }
}

extension RoutinePartCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIndentifier, for: indexPath) as! RoutineItemCell
        cell.viewModel = self.viewModel?.items[indexPath.row]
        
        return cell
    }
}

extension RoutinePartCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 20)
    }
}
