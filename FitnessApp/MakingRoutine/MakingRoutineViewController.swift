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
    @IBOutlet weak var bottomButton: UIButton!
    
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressBarHeightConstraint: NSLayoutConstraint!
    
    var viewModel: MakingRoutineViewModel?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "운동하기"
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        
        self.scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        let makingTitleView = MakingTitleView.MakingTitleView()
        makingTitleView.viewModel = self.viewModel
        
        self.scrollView.addSubview(makingTitleView)
        makingTitleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: makingTitleView.leadingAnchor),
            self.scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: makingTitleView.topAnchor),
            self.scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: makingTitleView.bottomAnchor),
            makingTitleView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor),
            makingTitleView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        ])
        
        let selectingPartView = SelectingPartView.SelectingPartView()
        selectingPartView.viewModel = self.viewModel
        
        self.scrollView.addSubview(selectingPartView)
        selectingPartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectingPartView.leadingAnchor.constraint(equalTo: makingTitleView.trailingAnchor),
            selectingPartView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            selectingPartView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            selectingPartView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            selectingPartView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        ])
        
        let settingRoutineView = SettingRoutineView.SettingRoutineView()
        settingRoutineView.viewModel = self.viewModel
        
        self.scrollView.addSubview(settingRoutineView)
        settingRoutineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingRoutineView.leadingAnchor.constraint(equalTo: selectingPartView.trailingAnchor),
            settingRoutineView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            settingRoutineView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            settingRoutineView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            settingRoutineView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        ])
        
        let orderingRoutineView = OrderingRoutineView.OrderingRoutineView()
        
        self.scrollView.addSubview(orderingRoutineView)
        orderingRoutineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderingRoutineView.leadingAnchor.constraint(equalTo: settingRoutineView.trailingAnchor),
            orderingRoutineView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            orderingRoutineView.trailingAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.trailingAnchor),
            orderingRoutineView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            orderingRoutineView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            orderingRoutineView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
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
        
        viewModel.didMakeRoutine = { [unowned self] routines in
            guard let navigationController = self.navigationController else { return }
            
//            navigationController.popViewController(animated: false)
            
            let orderingRoutinesViewController = OrderingRoutinesViewController()
            navigationController.pushViewController(orderingRoutinesViewController, animated: true)
        }
        
        viewModel.changeBottomButtonTitle = { [unowned self] title in
            self.bottomButton.setTitle(title, for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
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
        let progressBarRatio = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.bounds.width)
        self.progressBarWidthConstraint.constant = (self.progressBarView.bounds.width - CGFloat(70)) * progressBarRatio
    }
}
