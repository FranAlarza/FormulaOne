//
//  DetailViewModel.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 27/7/22.
//

import Foundation

protocol DetailViewModelProtocol {
    func onViewsLoaded()
}

final class DetailViewModel {
    
    weak private var viewDelegate: DetailViewControllerProtocol?
    var driversData: DriversModel?
    
    init(model: DriversModel, viewDelegate: DetailViewControllerProtocol) {
        driversData = model
        self.viewDelegate = viewDelegate
    }
    
}

extension DetailViewModel: DetailViewModelProtocol {
    
    func onViewsLoaded() {
        viewDelegate?.update(model: driversData)
    }
}
