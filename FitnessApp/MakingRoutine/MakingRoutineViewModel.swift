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
    var didUpdateRoutinesForSetting: (() -> Void)?
    var didUpdateRoutine: ((_ index: Int) -> Void)?
    var didUpdateRoutinesForOrdering: (() -> Void)?
    var changeBottomButtonTitle: ((_ title: String) -> Void)?
    
    let settingRoutineViewModel: SettingRoutineViewModel
    let orderingRoutineViewModel = OrderingRoutineViewModel()
    
    var title: String = ""
    var parts: [String] = ["어깨", "가슴", "등", "하체"]
    var routines: [Routine] = []
    
    var selectedParts: [Int] = []
    
    var currentPage: Int = 0
    let lastPage: Int = 3
    
    init() {
        self.settingRoutineViewModel = SettingRoutineViewModel()
        self.settingRoutineViewModel.addingRoutineCellViewModel = AddingRoutineCellViewModel(master: self)
    }
    
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
            self.settingRoutineViewModel.routineInfomationCellViewModel.didUpdateTitle?(self.title)
            self.settingRoutineViewModel.routineInfomationCellViewModel.items = self.selectedParts.map {
                RoutineInformationPartCellViewModel(title: self.parts[$0])
            }
            self.changeBottomButtonTitle?("다음")
            self.showPage?(page)
            
        case self.lastPage:
            self.orderingRoutineViewModel.routineInfomationCellViewModel.didUpdateTitle?(self.title)
            self.orderingRoutineViewModel.routineInfomationCellViewModel.items = self.selectedParts.map {
                RoutineInformationPartCellViewModel(title: self.parts[$0])
            }
            self.orderingRoutineViewModel.items = self.routines.enumerated().map {
                OrderingRoutineItemCellViewModel(index: $0.offset,
                                                 number: String($0.offset + 1),
                                                 title: $0.element.titie,
                                                 items: $0.element.items.enumerated().map {
                                                    OrderingRoutineItemSetCellViewModel(setCount: $0.offset + 1,
                                                                                        weight: $0.element.weight,
                                                                                        count: $0.element.count)
                                                 })
            }
            self.orderingRoutineViewModel.didUpdateRoutines?()
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
        self.settingRoutineViewModel.routinePartCellViewModels = self.routines.enumerated().map {
            RoutinePartCellViewModel(master: self,
                                     index: $0.offset,
                                     title: $0.element.titie,
                                     routineItems: $0.element.items)
        }
        self.settingRoutineViewModel.didUpdateRoutines?()
    }
    
    
    func addRoutinePart(_ index: Int) {
        let nextIndex = self.routines[index].items.count + 1
        if let weight = self.routines[index].items.last?.weight,
           let count = self.routines[index].items.last?.count {
            self.routines[index].items.append(RoutineItem(title: "\(nextIndex) SET", weight: weight, count: count))
        }
        self.settingRoutineViewModel.routinePartCellViewModels = self.routines.enumerated().map {
            RoutinePartCellViewModel(master: self,
                                     index: $0.offset,
                                     title: $0.element.titie,
                                     routineItems: $0.element.items)
        }
        self.settingRoutineViewModel.didUpdateRoutines?()
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

