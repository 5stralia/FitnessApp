//
//  ViewController.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/02.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var continuingDayLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var highestGoalLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var todayDescriptionLabel: UILabel!
    
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if (목표 설정 안됐다면)
        let settingGoalViewController = SettingGoalViewController()
        settingGoalViewController.modalPresentationStyle = .fullScreen
        self.present(settingGoalViewController, animated: false, completion: nil)
    }


    @IBAction func tappedStartFitnessButton(_ sender: Any) {
        let makingRoutineViewController = MakingRoutineViewController()
        let makingRoutineViewModel = MakingRoutineViewModel()
        makingRoutineViewController.viewModel = makingRoutineViewModel
        self.navigationController?.pushViewController(makingRoutineViewController, animated: true)
    }
    
    @IBAction func tappedViewRecodingButton(_ sender: Any) {
    }
    
}

