//
//  FitnessViewController.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/11.
//

import UIKit

class FitnessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func tappedButton(_ sender: Any) {
        let makingRoutineViewController = MakingRoutineViewController()
        let makingRoutineViewModel = MakingRoutineViewModel()
        makingRoutineViewController.viewModel = makingRoutineViewModel
        self.navigationController?.pushViewController(makingRoutineViewController, animated: true)
    }
    
}
