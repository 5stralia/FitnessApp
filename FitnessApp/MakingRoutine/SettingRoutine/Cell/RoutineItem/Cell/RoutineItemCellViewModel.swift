//
//  RoutineItemCellViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/18.
//

import Foundation

class RoutineItemCellViewModel {
    let master : MakingRoutineViewModel
    let superViewModel: RoutinePartCellViewModel
    let index: Int?
    
    let setCount: String
    var weight: String
    var count: String
    
    init(master: MakingRoutineViewModel,
         superViewModel: RoutinePartCellViewModel ,
         index: Int,
         setCount: Int,
         weight: String,
         count: String) {
        self.master = master
        self.superViewModel = superViewModel
        self.index = index
        
        self.setCount = "\(setCount) SET"
        self.weight = weight
        self.count = count
    }
    
    func change(weight: Int) {
        if let index = self.index {
            self.superViewModel.change(index: index, weight: weight)
        }
    }
    
    func change(count: Int) {
        if let index = self.index {
            self.superViewModel.change(index: index, count: count)
        }
    }
}
