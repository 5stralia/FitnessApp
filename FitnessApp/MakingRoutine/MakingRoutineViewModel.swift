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
    var changeBottomButtonTitle: ((_ title: String) -> Void)?
    
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
    
    var currentPage: Int = 0
    let lastPage: Int = 3
    
    func next() {
        let nextPage = self.currentPage + 1
        
        self.change(page: nextPage)
    }
    
    func prev() {
        let prevPage = self.currentPage - 1
        
        self.change(page: prevPage)
    }
    
    private func change(page: Int) {
        self.currentPage = page
        
        switch page {
        case ..<0:
            self.back?()
            
        case 0:
            self.showPage?(page)
            
        case 1:
            self.showPage?(page)
            
        case 2:
            self.changeBottomButtonTitle?("다음")
            self.showPage?(page)
            
        case self.lastPage:
            self.changeBottomButtonTitle?("저장하고 운동하기")
            self.showPage?(page)
            
        default:
            self.didMakeRoutine?(self.routines)
        }
    }
    
    func selectPart(_ index: Int) {
        self.selectedParts.append(index)
    }
    
    func deselectPart(_ index: Int) {
        self.selectedParts = self.selectedParts.filter({ $0 != index })
        
//        self.routines = self.routines.filter({$0.titie != self.parts[index]})
    }
    
    func changeTitle(_ index: Int, title: String) {
        self.routines[index].titie = title
    }
    
    func changeWeight(routinedIndex: Int, itemIndex: Int, weight: Int) {
        self.routines[routinedIndex].items[itemIndex].weight = weight
    }
    
    func changeCount(routinedIndex: Int, itemIndex: Int, count: Int) {
        self.routines[routinedIndex].items[itemIndex].count = count
    }
    
    func addRoutine() {
        self.routines.append(Routine(titie: "", items: [
            RoutineItem(title: "1 SET", weight: 0, count: 0)
        ]))
    }
    
    
    func addRoutinePart(_ index: Int) {
        let nextIndex = self.routines[index].items.count + 1
        if let weight = self.routines[index].items.last?.weight,
           let count = self.routines[index].items.last?.count {
            self.routines[index].items.append(RoutineItem(title: "\(nextIndex) SET", weight: weight, count: count))
        }
    }
}

struct Routine {
    var titie: String
    var items: [RoutineItem]
}

struct RoutineItem {
    var title: String
    var weight: Int
    var count: Int
}

