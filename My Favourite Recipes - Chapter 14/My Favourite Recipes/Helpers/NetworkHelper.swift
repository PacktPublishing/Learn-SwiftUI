//
//  NetworkHelper.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 31/12/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit

class NetworkHelper: Any {

    static func loadData(url: URL, completion: @escaping (UIImage?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            completion(UIImage(data: data))
        }.resume()
        
    }
    
}
