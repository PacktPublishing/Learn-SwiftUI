//
//  RefreshHelper.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 02/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import UIKit
import SwiftUI

struct RefreshHelper: UIViewRepresentable {
        
    func makeUIView(context: Context) -> UIRefreshControl {
        return UIRefreshControl()
    }
    
    func updateUIView(_ uiView: UIRefreshControl, context: Context) {

    }
    
    
}
