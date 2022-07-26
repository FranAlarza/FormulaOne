//
//  Models.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 21/7/22.
//

import Foundation

struct Driver: Decodable {
    let permanentNumber: String
    let code: String
    let givenName: String
    let familyName: String
    let nationality: String
}

struct DriverTable {
    let drivers: [Driver]
    
    enum CodingKeys: String, CodingKey {
        case drivers = "Drivers"
    }
}

struct MRData {
    let driverTable: DriverTable
    
    enum CodingKeys: String, CodingKey {
        case driverTable = "DriverTable"
    }
}






/**
 
 {
     "MRData": {
         "xmlns": "http://ergast.com/mrd/1.5",
         "series": "f1",
         "url": "http://ergast.com/api/f1/2022/drivers.json",
         "limit": "30",
         "offset": "0",
         "total": "21",
         "DriverTable": {
             "season": "2022",
             "Drivers": [
                 {
                     "driverId": "albon",
                     "permanentNumber": "23",
                     "code": "ALB",
                     "url": "http://en.wikipedia.org/wiki/Alexander_Albon",
                     "givenName": "Alexander",
                     "familyName": "Albon",
                     "dateOfBirth": "1996-03-23",
                     "nationality": "Thai"
                 },
 */
