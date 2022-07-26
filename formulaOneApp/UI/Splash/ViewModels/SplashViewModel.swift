//
//  SplasViewModel.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 20/7/22.
//

import Foundation

protocol SplashViewModelProtocol {
    func onViewsLoaded()
}

final class SplashViewModel {
    
    weak var viewDelegate: SplashViewProtocol?
    
    init(viewDelegate: SplashViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewDelegate?.showLoading(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            self?.viewDelegate?.showLoading(false)
            self?.viewDelegate?.navigateToDriversTabel()
        }
    }
    
}

extension SplashViewModel: SplashViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
}
