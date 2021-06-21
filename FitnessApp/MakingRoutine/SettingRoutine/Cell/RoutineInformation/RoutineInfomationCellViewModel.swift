//
//  RoutineInfomationCellViewModel.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/18.
//

import Foundation

class RoutineInfomationCellViewModel {
    var didUpdateTitle: ((_ title: String) -> Void)?
    var didUpdateSelectedParts: (() -> Void)?
    
    var title: String {
        didSet {
            self.didUpdateTitle?(title)
        }
    }
    var items: [RoutineInformationPartCellViewModel]{
        didSet {
            self.didUpdateSelectedParts?()
        }
    }
    
    init(title: String, items: [RoutineInformationPartCellViewModel]) {
        self.title = title
        self.items = items
    }
    
    func title(_ index: Int) -> String {
        return self.items[index].title
    }
}
