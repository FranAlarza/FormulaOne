//
//  DetailViewController.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 26/7/22.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    func update(model: DriversModel?)
    func update(image: String)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        driverImage.layer.cornerRadius = driverImage.frame.size.width / 2
        driverImage.clipsToBounds = true
        viewModel?.onViewsLoaded()
    }
    
}

extension DetailViewController: DetailViewControllerProtocol {
    func update(image: String) {
        driverImage.image = UIImage(named: image)
    }
    
    func update(model: DriversModel?){
        if let model = model {
            driverImage.image = UIImage(named: model.familyName)
            nameLabel.text = "\(model.givenName) \(model.familyName)"
            nationalityLabel.text = model.nationality
            birthLabel.text = model.dateOfBirth
        }
    }
}
