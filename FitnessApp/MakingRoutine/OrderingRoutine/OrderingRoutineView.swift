//
//  OrderingRoutineView.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/15.
//

import UIKit

class OrderingRoutineView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: OrderingRoutineViewModel? {
        didSet {
            self.bindViewModel()
        }
    }
    
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
        
        self.collectionView.dragInteractionEnabled = true
        self.collectionView.dragDelegate = self
        self.collectionView.dropDelegate = self
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.didUpdateRoutines = { [unowned self] in
            self.collectionView.reloadData()
        }
        
        viewModel.didToggle = { [unowned self] index in
            self.collectionView.reloadItems(at: [IndexPath(row: index + 1, section: 0)])
        }
    }

}

extension OrderingRoutineView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  1 + (self.viewModel?.items.count ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.informationCellIdentifier,
                                                          for: indexPath) as! RoutineInfomationCell
            cell.viewModel = self.viewModel?.routineInfomationCellViewModel
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.orderingCellIdentifier,
                                                          for: indexPath) as! OrderingRoutineItemCell
            cell.viewModel = self.viewModel?.items[indexPath.row - 1]
            
            return cell
        }
    }
}

extension OrderingRoutineView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.bounds.width, height: 170)
        } else {
            let height = self.viewModel?.items[indexPath.row - 1].height
            return CGSize(width: collectionView.bounds.width, height: CGFloat(height ?? 0))
        }
    }
}

extension OrderingRoutineView: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        guard indexPath.row != 0,
              let title = self.viewModel?.items[indexPath.row - 1].title
        else {
            return []
        }
        
        let item = NSItemProvider(object: title as NSString)
        let dragItem = UIDragItem(itemProvider: item)
        
        return [dragItem]
    }
    
}

extension OrderingRoutineView: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath,
              destinationIndexPath.row != 0
        else {
            return
        }
        
        coordinator.items.forEach { item in
            guard let sourceIndexPath = item.sourceIndexPath else { return }
            
            self.viewModel?.move(from: sourceIndexPath.row - 1, to: destinationIndexPath.row - 1)
            
            collectionView.performBatchUpdates {
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
            } completion: { _ in
                coordinator.drop(item.dragItem, toItemAt: destinationIndexPath).addCompletion { _ in
                    collectionView.reloadData()
                }
            }

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    
}
