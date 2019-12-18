//
//  ViewModelList.swift
//  Chapter 3 Architecture
//
//  Created by Chris Barker on 12/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit
import Combine

class PostViewModel: ObservableObject {
    
    init() {
        getPosts()
    }
    @Published var articles = [PostModel]()
    
    private func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        NetworkManager.loadData(url: url) { articles in
            
            if let articles = articles {
                self.articles = articles.map(PostModel.init)
            }
            
        }
        
    }
    
}
