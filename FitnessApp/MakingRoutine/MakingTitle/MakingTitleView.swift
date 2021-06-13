//
//  MakingTitleView.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/03.
//

import UIKit

final class MakingTitleView: UIView {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textCountLabel: UILabel!
    
    var viewModel: MakingRoutineViewModel?
    
    private let maxTitleCount = 11
    
    class func MakingTitleView() -> MakingTitleView {
        return Bundle.main.loadNibNamed("MakingTitleView", owner: nil)!.first as! MakingTitleView
    }
    
    @IBAction func didChange(_ textField: UITextField) {
        self.textCountLabel.text = "\(textField.text?.count ?? 0) / \(self.maxTitleCount)"
        
        if let text = textField.text {
            self.viewModel?.title = text
        }
    }
    
    
}

extension MakingTitleView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.compactMap({$0}).count ?? 0) + string.compactMap({$0}).count - range.length
        return newLength <= self.maxTitleCount
    }
}
