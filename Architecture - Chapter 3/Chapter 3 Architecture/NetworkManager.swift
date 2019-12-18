//
//  NetworkManager.swift
//  Chapter 3 Architecture
//
//  Created by Chris Barker on 12/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static func loadData(url: URL, completion: @escaping ([PostResponse]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            if let response = try? JSONDecoder().decode([PostResponse].self, from: data) {
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
        
    }
    
}
