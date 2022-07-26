//
//  DriversTableController.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 20/7/22.
//

import UIKit

protocol DriverTableProtocol: AnyObject {
    func updateViews()
    func navigateToDetail(with data: DriversModel?)
}

class DriversTableController: UIViewController {
    
    var viewModel: DriverTableViewModelProtocol?
    let tableView = UITableView()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        view.addSubview(tableView)
        viewModel?.onViewsLoaded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func configureTable() {
        title = "Drivers"
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "DriversCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}

extension DriversTableController: DriverTableProtocol {
    func navigateToDetail(with data: DriversModel?) {
        let nextVC = DetailViewController()
        nextVC.driversData = data
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func updateViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension DriversTableController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.driversCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DriversCell else {
            return UITableViewCell() }
        
        if let data = viewModel?.data(for: indexPath.row) {
            cell.setDrivers(model: data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.onItemSelected(at: indexPath.row)
    }
    
}
