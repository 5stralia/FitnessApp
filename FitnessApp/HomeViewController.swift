//
//  ViewController.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/02.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalStatusLabel: UILabel!
    @IBOutlet weak var initialGoadStatusLabel: UILabel!
    @IBOutlet weak var currentGoadStatusLabel: UILabel!
    @IBOutlet weak var finishedGoalStatusLabel: UILabel!
    @IBOutlet weak var startDataLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var todayDescriptionLabel: UILabel!
    
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let settingGoalViewController = SettingGoalViewController()
        settingGoalViewController.modalPresentationStyle = .fullScreen
        self.present(settingGoalViewController, animated: false, completion: nil)
    }

}

