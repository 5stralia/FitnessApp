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
    
    class func MakingTitleView() -> MakingTitleView {
        return Bundle.main.loadNibNamed("MakingTitleView", owner: nil)!.first as! MakingTitleView
    }

    @IBAction func tappedNextButton(_ sender: Any) {
    }
}

extension MakingTitleView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
