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
    
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressBarHeightConstraint: NSLayoutConstraint!
    
    var viewModel: MakingRoutineViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        
        self.scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        let makingTitleView = MakingTitleView.MakingTitleView()
        
        self.scrollView.addSubview(makingTitleView)
        makingTitleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.leadingAnchor.constraint(equalTo: makingTitleView.leadingAnchor),
            self.scrollView.topAnchor.constraint(equalTo: makingTitleView.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: makingTitleView.bottomAnchor),
            makingTitleView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor),
            makingTitleView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        ])
        
        let selectingPartView = SelectingPartView.SelectingPartView()
        
        self.scrollView.addSubview(selectingPartView)
        selectingPartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectingPartView.leadingAnchor.constraint(equalTo: makingTitleView.trailingAnchor),
            selectingPartView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            selectingPartView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            selectingPartView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            selectingPartView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            selectingPartView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        ])
        
        self.bindViewModel()
        
        
    }
    
    private func bindViewModel() {
        guard let viewModel = self.viewModel else { return }
        
        viewModel.showPage = { [unowned self] pageNO in
            let offSetX = self.view.bounds.width * CGFloat(pageNO)
            
            self.scrollView.setContentOffset(CGPoint(x: offSetX, y: 0), animated: true)
        }
        
        viewModel.back = { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func tappedNextButton(_ sender: Any) {
        self.viewModel?.next()
    }
    
    @objc private func back() {
        self.viewModel?.prev()
    }
    
}

extension MakingRoutineViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progressBarRatio = scrollView.contentOffset.x / scrollView.contentSize.width
        self.progressBarWidthConstraint.constant = (self.progressBarView.bounds.width - CGFloat(80)) * progressBarRatio
    }
}
