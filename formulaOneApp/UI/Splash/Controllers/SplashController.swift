//
//  SplashViewController.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 20/7/22.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    func showLoading(_ show: Bool)
    func navigateToDriversTabel()
}

class SplashController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: SplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }
}

extension SplashController: SplashViewProtocol {
    
    func showLoading(_ show: Bool) {
        switch show {
            case true where !activityIndicator.isAnimating:
                activityIndicator.startAnimating()
            case false where activityIndicator.isAnimating:
                activityIndicator.stopAnimating()
            default: break
        }
    }
    
    func navigateToDriversTabel() {
        let driversTable = DriversTableController()
        driversTable.viewModel = DriversTableViewModel(viewDelegate: driversTable)
        navigationController?.setViewControllers([driversTable], animated: true)
    }
    
}
