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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.items[section].items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let item = self.viewModel?.items[indexPath.section].items[indexPath.row] {
            switch item {
            case .informationItem(let cellViewModel):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.informationCellIdentifier,
                                                              for: indexPath) as! RoutineInfomationCell
                cell.viewModel = cellViewModel
                
                return cell
                
            case .routineItem(let cellViewModel):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.orderingCellIdentifier,
                                                              for: indexPath) as! OrderingRoutineItemCell
                cell.viewModel = cellViewModel
                
                return cell
                
            }
        } else {
            fatalError("OrderingRoutineView cellForItemAt")
        }
    }
}

extension OrderingRoutineView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let item = self.viewModel?.items[indexPath.section].items[indexPath.row] else { return .zero }
        
        switch item {
        case .informationItem:
            return CGSize(width: collectionView.bounds.width, height: 170)
            
        case .routineItem(let cellViewModel):
            return CGSize(width: collectionView.bounds.width, height: CGFloat(cellViewModel.height))
        }
    }
}

extension OrderingRoutineView: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        guard let item = self.viewModel?.items[indexPath.section].items[indexPath.row] else { return [] }
        
        switch item {
        case .routineItem(let cellViewModel):
            let itemProvider = NSItemProvider(object: cellViewModel.title as NSString)
            let dragItem = UIDragItem(itemProvider: itemProvider)
            
            return [dragItem]
            
        default:
            return []
        }
    }
    
}

extension OrderingRoutineView: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath,
              let sectionItem = self.viewModel?.items[destinationIndexPath.section]
        else { return }
        
        switch sectionItem {
        case .information:
            return
            
        case .routines(let items):
            let item = items[destinationIndexPath.row]
            switch item {
            case .routineItem:
                coordinator.items.forEach { item in
                    guard let sourceIndexPath = item.sourceIndexPath else { return }
                    
                    self.move(collectionView,
                              performDropWith: coordinator,
                              item: item,
                              from: sourceIndexPath,
                              to: destinationIndexPath)
                }
                
            default:
                return
            }
        }
    }
    
    private func move(_ collectionView: UICollectionView,
                      performDropWith coordinator: UICollectionViewDropCoordinator,
                      item: UICollectionViewDropItem,
                      from: IndexPath,
                      to: IndexPath) {
        self.viewModel?.move(from: from.row, to: to.row)
        
        collectionView.performBatchUpdates {
            collectionView.deleteItems(at: [from])
            collectionView.insertItems(at: [to])
        } completion: { _ in
            coordinator.drop(item.dragItem, toItemAt: to).addCompletion { _ in
                collectionView.reloadData()
            }
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
    
}
