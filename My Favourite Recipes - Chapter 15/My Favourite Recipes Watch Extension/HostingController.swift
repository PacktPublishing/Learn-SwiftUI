//
//  HostingController.swift
//  My Favourite Recipes Watch Extension
//
//  Created by Chris Barker on 15/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI
import WatchConnectivity


class HostingController: WKHostingController<HomeView>, WCSessionDelegate {

    @Published var recipes = WatchHelper.getRecipes()
    
    override var body: HomeView {
        return HomeView(recipes: recipes)
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
        
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
        if let keyName = message.keys.first,
            let value = message[keyName] as? String {
            recipes = WatchHelper.addRecipe(recipeString: value)
            setNeedsBodyUpdate()
            
        }
            
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

}
