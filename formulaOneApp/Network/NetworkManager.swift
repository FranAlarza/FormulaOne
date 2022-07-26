//
//  DriversApiCall.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 25/7/22.
//

import Foundation


class NetworkManager {
    func driversCall(url: String, completion: @escaping ([DriversModel], Error?) -> Void) {
        guard let dataUrl = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: dataUrl) { data, response, error in
            guard error == nil else {
                completion([], .none)
                return
            }

               if let data = data {
                   if let driversResponse = try? JSONDecoder().decode(MRData.self, from: data) {
                       completion(driversResponse.MRData.DriverTable.Drivers, nil)
                   }
            }
        }.resume()
    }
}
