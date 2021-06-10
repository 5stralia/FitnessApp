//
//  SettingGoalViewController.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/09.
//

import UIKit

class SettingGoalViewController: UIViewController {
    @IBOutlet weak var weightGoalButton: UIButton!
    @IBOutlet weak var steadyGoadButton: UIButton!
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstGoalLabel: UILabel!
    @IBOutlet weak var firstUnitLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondGoalLabel: UILabel!
    @IBOutlet weak var secondUnitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weightGoalButton.backgroundColor = .systemGray2
        self.weightGoalButton.setTitleColor(.white, for: .normal)
    }

    @IBAction func tappedWeightGoalButton(_ sender: Any) {
        self.weightGoalButton.backgroundColor = .systemGray2
        self.weightGoalButton.setTitleColor(.white, for: .normal)
        
        self.steadyGoadButton.backgroundColor = .clear
        self.steadyGoadButton.setTitleColor(.systemGray2, for: .normal)
        
        self.firstTitleLabel.text = "현재 체중"
        self.firstUnitLabel.text = "KG"
        
        self.secondTitleLabel.text = "목표 체중"
        self.secondUnitLabel.text = "KG"
    }
    
    @IBAction func tappedSteadyGoalButton(_ sender: Any) {
        self.weightGoalButton.backgroundColor = .clear
        self.weightGoalButton.setTitleColor(.systemGray2, for: .normal)
        
        self.steadyGoadButton.backgroundColor = .systemGray2
        self.steadyGoadButton.setTitleColor(.white, for: .normal)
        
        self.firstTitleLabel.text = "목표 주간 운동 횟수"
        self.firstUnitLabel.text = "회"
        
        self.secondTitleLabel.text = "목표 회당 운동 시간"
        self.secondUnitLabel.text = "분"
    }
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        // 완료!
        self.dismiss(animated: true, completion: nil)
    }
}
