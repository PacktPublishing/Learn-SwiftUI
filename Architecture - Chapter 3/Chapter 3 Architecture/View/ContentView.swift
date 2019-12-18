//
//  ContentView.swift
//  Chapter 3 Architecture
//
//  Created by Chris Barker on 12/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import SwiftUI


struct ContentView : View {
    
    @ObservedObject var model = PostViewModel()
    
    var body: some View {
        List(model.articles) { article in
            
            VStack(alignment: .leading) {
                Text(article.title)
                Text(article.description)
                    .foregroundColor(.secondary)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
