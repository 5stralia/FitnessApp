//
//  SettingRoutineViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/18.
//

import Foundation

class SettingRoutineViewModel {
    var didUpdateRoutines: (() -> Void)?
    
    let routineInfomationCellViewModel = RoutineInfomationCellViewModel(title: "", items: [])
    var routinePartCellViewModels: [RoutinePartCellViewModel] = []
    var addingRoutineCellViewModel: AddingRoutineCellViewModel! = nil
}
