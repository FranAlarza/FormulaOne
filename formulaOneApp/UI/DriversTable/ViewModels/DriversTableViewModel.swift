//
//  DriversTableViewModel.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 25/7/22.
//

import Foundation

protocol DriverTableViewModelProtocol {
    func onViewsLoaded()
    func data(for index: Int) -> DriversModel?
    func onItemSelected(at index: Int)
    var driversCount: Int { get }
}

final class DriversTableViewModel {
    
    private weak var viewDelegate: DriverTableProtocol?
    private var networkManager = NetworkManager()
    var drivers: [DriversModel] = []
    
    init(viewDelegate: DriverTableProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    func loadData() {
        networkManager.driversCall(url: "http://ergast.com/api/f1/2022/drivers.json") { [weak self] dataDrivers, _ in
            self?.drivers = dataDrivers
            self?.viewDelegate?.updateViews()
        }
    }
}

extension DriversTableViewModel: DriverTableViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
    
    var driversCount: Int {
        drivers.count
    }
    
    func data(for index: Int) -> DriversModel? {
        return drivers[index]
    }
    
    func onItemSelected(at index: Int) {
        guard let data = data(for: index) else { return }
            viewDelegate?.navigateToDetail(with: data)
    }
    
}
