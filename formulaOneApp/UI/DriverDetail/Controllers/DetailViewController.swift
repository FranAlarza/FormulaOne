//
//  DetailViewController.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 26/7/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    
    var driversData: DriversModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update(image: "")
        update()
    }
    
    private func update(image: String) {
        driverImage.image = UIImage(named: image)
    }
    
    private func update(){
        if let driversData = driversData {
            nameLabel.text = "\(driversData.givenName) \(driversData.familyName)"
            nationalityLabel.text = driversData.nationality
            birthLabel.text = driversData.dateOfBirth
        }
        
    }
    
}
