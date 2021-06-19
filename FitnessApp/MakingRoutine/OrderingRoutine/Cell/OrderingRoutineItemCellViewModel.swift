//
//  OrderingRoutineItemCellViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/18.
//

import Foundation

class OrderingRoutineItemCellViewModel {
    var superViewModel: OrderingRoutineViewModel?
    let index: Int
    
    var number: String
    let title: String
    let items: [OrderingRoutineItemSetCellViewModel]
    
    var isHiddenItems = true
    var height: Int {
        let titleHeight = 47
        
        if self.isHiddenItems {
            return titleHeight
        } else {
            let sectionTopHeight = 10
            let cellHeight = 17
            let cellSpace = 5
            let sectionBottomHeight = 10
            return titleHeight
                + (sectionTopHeight
                    + self.items.count * cellHeight
                    + (self.items.count - 1) * cellSpace
                    + sectionBottomHeight)
        }
    }
    
    init(index: Int, number: String, title: String, items: [OrderingRoutineItemSetCellViewModel]) {
        self.index = index
        
        self.number = number
        self.title = title
        self.items = items
    }
    
    func toggle() {
        self.isHiddenItems.toggle()
        self.superViewModel?.toggle(index: self.index)
    }
}
