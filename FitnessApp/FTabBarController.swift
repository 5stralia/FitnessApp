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
        
        self.tabBar.barTintColor = UIColor(named: "Gray900")
        self.tabBar.tintColor = .white
        self.tabBar.isTranslucent = false

        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "ic_home"), tag: 0)
        
        let fitnessNavigationController = UINavigationController(rootViewController: FitnessViewController())
        fitnessNavigationController.navigationBar.barTintColor = UIColor(named: "Gray900")
        fitnessNavigationController.navigationBar.tintColor = .white
        fitnessNavigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        fitnessNavigationController.navigationBar.isTranslucent = false
        fitnessNavigationController.tabBarItem = UITabBarItem(title: "운동하기", image: UIImage(named: "ic_dumbbel"), tag: 1)
        
        let recordingViewController = UIViewController()
        recordingViewController.tabBarItem = UITabBarItem(title: "나의기록", image: UIImage(named: "ic_medal"), tag: 2)
        
        let settingViewController = UIViewController()
        settingViewController.tabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "gearshape"), tag: 3)
        
        self.viewControllers = [
            homeViewController,
            fitnessNavigationController,
            recordingViewController,
            settingViewController
        ]
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
