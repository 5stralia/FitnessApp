//
//  OrderingRoutineViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/18.
//

import Foundation

class OrderingRoutineViewModel {
    var didUpdateRoutines: (() -> Void)?
    var didToggle:((_ index: Int) -> Void)?
     
    var items: [OrderingRoutineSection] = []
    
    func toggle(index: Int) {
        self.didToggle?(index)
    }
    
    func move(from: Int, to: Int) {
        self.items = self.items.map { item in
            switch item {
            case .routines(let routineItems):
                var movedItems = routineItems
                
                let movingitem = movedItems.remove(at: from)
                movedItems.insert(movingitem, at: to)
                
                movedItems = movedItems.enumerated().map {
                    switch $0.element {
                    case .routineItem(let cellViewModel):
                        return .routineItem(cellViewModel: OrderingRoutineItemCellViewModel(index: cellViewModel.index,
                                                                                        number: String($0.offset + 1),
                                                                                        title: cellViewModel.title,
                                                                                        items: cellViewModel.items))
                        
                    default:
                        return $0.element
                    }
                }
                
                return .routines(items: movedItems)
                
            default:
                return item
            }
        }
    }
}
