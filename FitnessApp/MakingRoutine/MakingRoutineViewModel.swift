//
//  MakingRoutineViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/04.
//

import Foundation

class MakingRoutineViewModel {
    var showPage: ((Int) -> Void)?
    var back: (() -> Void)?
    
    private var currentPage: Int = 0
    
    func next() {
        self.currentPage += 1
        self.showPage?(self.currentPage)
    }
    
    func prev() {
        self.currentPage -= 1
        
        if self.currentPage < 0 {
            self.back?()
        } else {
            self.showPage?(self.currentPage)
        }
    }
}
