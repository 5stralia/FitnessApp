//
//  MakingRoutineViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/04.
//

import Foundation

final class MakingRoutineViewModel {
    var showPage: ((Int) -> Void)?
    var back: (() -> Void)?
    var didMakeRoutine: ((_ routines: [Routine]) -> Void)?
    var didUpdateTitle: ((_ title: String) -> Void)?
    var didUpdateSelectedParts: (() -> Void)?
    var didUpdateRoutines: (() -> Void)?
    var didUpdateRoutine: ((_ index: Int) -> Void)?
    
    var title: String = "" {
        didSet {
            self.didUpdateTitle?(title)
        }
    }
    var parts: [String] = ["어깨", "가슴", "등", "하체"]
    var routines: [Routine] = [] {
        didSet {
            self.didUpdateRoutines?()
        }
    }
    
    var selectedParts: [Int] = [] {
        didSet {
            self.didUpdateSelectedParts?()
        }
    }
    
    private var currentPage: Int = 0
    private let lastPage: Int = 2
    
    func next() {
        let nextPage = self.currentPage + 1
        
        if nextPage > lastPage {
            self.didMakeRoutine?(self.routines)
        } else {
            self.currentPage = nextPage
            self.showPage?(nextPage)
        }
        
    }
    
    func prev() {
        let prevPage = self.currentPage - 1
        
        if prevPage < 0 {
            self.back?()
        } else {
            self.currentPage = prevPage
            self.showPage?(prevPage)
        }
    }
    
    func selectPart(_ index: Int) {
        self.selectedParts.append(index)
        
        self.routines.append(Routine(titie: self.parts[index], items: [RoutineItem(title: "추가", count: 3)]))
    }
    
    func deselectPart(_ index: Int) {
        self.selectedParts = self.selectedParts.filter({ $0 != index })
        
        self.routines = self.routines.filter({$0.titie != self.parts[index]})
    }
    
    func addRoutinePart(_ index: Int) {
        self.routines[index].items.append(RoutineItem(title: "추가염", count: 3))
    }
    
    func addCount(routineIndex: Int, itemIndex: Int) {
        guard self.routines[routineIndex].items[itemIndex].count < 100 else { return }
        self.routines[routineIndex].items[itemIndex].count += 1
    }
    
    func subCount(routineIndex: Int, itemIndex: Int) {
        guard self.routines[routineIndex].items[itemIndex].count > 1 else { return }
        self.routines[routineIndex].items[itemIndex].count -= 1
    }
}

struct Routine {
    let titie: String
    var items: [RoutineItem]
}

struct RoutineItem {
    var title: String
    var count: Int
}

