//
//  DriversCell.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 21/7/22.
//

import UIKit

final class DriversCell: UITableViewCell {

    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var driverNumber: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var shortName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setDrivers(model: DriversModel) {
        countryFlag.image = UIImage(named: model.nationality)
        driverNumber.text = "#\(model.permanentNumber)"
        driverName.text = "\(model.givenName) \(model.familyName)"
        shortName.text = model.code
    }
    
}
