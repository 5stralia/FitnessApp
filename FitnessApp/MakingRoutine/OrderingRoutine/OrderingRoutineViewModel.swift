//
//  OrderingRoutineViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/18.
//

import Foundation

class OrderingRoutineViewModel {
    var didUpdateRoutines: (() -> Void)?
     
    var routineInfomationCellViewModel = RoutineInfomationCellViewModel()
    var items: [OrderingRoutineItemCellViewModel] = []
}
