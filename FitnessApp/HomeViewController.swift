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
    }


    @IBAction func tappedStartFitnessButton(_ sender: Any) {
        let makingRoutineViewController = MakingRoutineViewController()
        self.navigationController?.pushViewController(makingRoutineViewController, animated: true)
    }
    
    @IBAction func tappedViewRecodingButton(_ sender: Any) {
    }
    
}

