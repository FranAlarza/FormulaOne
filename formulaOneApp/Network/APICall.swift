//
//  APICall.swift
//  formulaOneApp
//
//  Created by Fran Alarza on 21/7/22.
//

import Foundation

enum NetworkError: Error {
    case sessionError
    case responseError(Int)
    case decodingDataError
}

class NetworkCall {
    func apiCall(url: String, completion: @escaping ([Driver]?, NetworkError?) -> Void) {
        
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error != nil else {
                completion([], .sessionError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion([], .responseError((response as? HTTPURLResponse)?.statusCode ?? 0))
                return
            }
            
            guard let data = data else {
                return
            }
            
            let driversResponse = try? JSONDecoder().decode([Driver].self, from: data)
            completion(driversResponse, nil)
            
        }
        task.resume()
    }
}
