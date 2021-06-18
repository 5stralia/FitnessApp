//
//  AddingRoutineCellViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/18.
//

import Foundation

class AddingRoutineCellViewModel {
    let master: MakingRoutineViewModel
    
    init(master: MakingRoutineViewModel) {
        self.master = master
    }
    
    func addRoutine() {
        self.master.addRoutine()
    }
}
