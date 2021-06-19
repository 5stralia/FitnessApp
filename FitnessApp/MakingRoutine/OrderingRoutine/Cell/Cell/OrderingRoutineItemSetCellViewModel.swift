//
//  OrderingRoutineItemSetCellViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/19.
//

import Foundation

class OrderingRoutineItemSetCellViewModel {
    let setCount: String
    let weight: String
    let count: String
    
    init(setCount: Int, weight: Int, count: Int) {
        self.setCount = "\(setCount) SET"
        self.weight = "\(weight) 개"
        self.count = "\(count) 개"
    }
}
