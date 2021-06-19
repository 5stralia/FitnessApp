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
     
    var routineInfomationCellViewModel = RoutineInfomationCellViewModel()
    var items: [OrderingRoutineItemCellViewModel] = [] {
        didSet {
            self.items.enumerated().forEach {
                $0.element.superViewModel = self
                $0.element.number = String($0.offset + 1)
            }
        }
    }
    
    func toggle(index: Int) {
        self.didToggle?(index)
    }
    
    func move(from: Int, to: Int) {
        let item = self.items.remove(at: from)
        self.items.insert(item, at: to)
    }
}
