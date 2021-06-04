//
//  MakingRoutineViewController.swift
//  FitnessApp
//
//  Created by 최호주 on 2021/06/03.
//

import UIKit

class MakingRoutineViewController: UIViewController {
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var progressBarHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        let makingTitleView = MakingTitleView.MakingTitleView()
        self.scrollView.addSubview(makingTitleView)
        makingTitleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.leadingAnchor.constraint(equalTo: makingTitleView.leadingAnchor),
            self.scrollView.topAnchor.constraint(equalTo: makingTitleView.topAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: makingTitleView.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: makingTitleView.bottomAnchor),
            makingTitleView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor),
            makingTitleView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        ])
    }

}
