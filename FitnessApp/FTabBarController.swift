//
//  FTabBarController.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/12.
//

import UIKit

class FTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "ic_home"), tag: 0)
        
        let fitnessNavigationController = UINavigationController(rootViewController: FitnessViewController())
        fitnessNavigationController.tabBarItem = UITabBarItem(title: "운동하기", image: UIImage(named: "ic_dumbbel"), tag: 1)
        
        self.viewControllers = [homeViewController, fitnessNavigationController]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
