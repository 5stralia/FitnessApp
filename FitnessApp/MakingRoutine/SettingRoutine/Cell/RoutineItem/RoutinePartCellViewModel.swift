//
//  RoutinePartCellViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/18.
//

import Foundation

class RoutinePartCellViewModel {
    let master: MakingRoutineViewModel
    let index: Int?
    
    var didUpdateItems: (() -> Void)?
    
    var title: String
    var items: [RoutineItemCellViewModel] = []
    
    init(master: MakingRoutineViewModel, index: Int, title: String, routineItems: [RoutineItem]) {
        self.master = master
        self.index = index
        
        self.title = title
        self.items = routineItems.enumerated().map {
            RoutineItemCellViewModel(master: master,
                                     superViewModel: self,
                                     index: $0.offset,
                                     setCount: $0.offset,
                                     weight: String($0.element.weight),
                                     count: String($0.element.count))
        }
    }
    
    func change(title: String) {
        if let index = self.index {
            self.master.changeTitle(index, title: title)
        }
    }
    
    func change(index: Int, weight: Int) {
        if let routinedIndex = self.index {
            self.master.changeWeight(routinedIndex: routinedIndex, itemIndex: index, weight: weight)
        }
    }
    
    func change(index: Int, count: Int) {
        if let routineIndex = self.index {
            self.master.changeCount(routinedIndex: routineIndex, itemIndex: index, count: count)
        }
    }
    
    func addRoutinePart() {
        if let index = self.index {
            self.master.addRoutinePart(index)
        }
    }
}
