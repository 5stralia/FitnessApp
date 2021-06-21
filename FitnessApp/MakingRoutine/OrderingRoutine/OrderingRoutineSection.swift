//
//  OrderingRoutineSection.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/20.
//

import Foundation

enum OrderingRoutineSection {
    case information(items: [OrderingRoutineSectionItems])
    case routines(items: [OrderingRoutineSectionItems])
    
    var items : [OrderingRoutineSectionItems] {
        switch self {
        case .information(let items): return items
        case .routines(let items): return items
        }
    }
}

enum OrderingRoutineSectionItems {
    case informationItem(cellViewModel: RoutineInfomationCellViewModel)
    case routineItem(cellViewModel: OrderingRoutineItemCellViewModel)
}
