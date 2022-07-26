//
//  DriversModel.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 25/7/22.
//

import Foundation

struct DriversModel: Decodable {
    
    let permanentNumber: String
    let code: String
    let nationality: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
}

struct DriverTableModel: Decodable {
    var season: String
    var Drivers: [DriversModel]
    
}

struct MRDataModel: Decodable {
    var DriverTable: DriverTableModel
}

struct MRData: Decodable {
    var MRData: MRDataModel
}






