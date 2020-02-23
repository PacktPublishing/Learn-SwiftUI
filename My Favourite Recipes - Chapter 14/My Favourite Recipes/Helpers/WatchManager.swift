//
//  WatchManager.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 18/01/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import UIKit
import WatchConnectivity

class WatchManager: NSObject, WCSessionDelegate {
        
    // MARK: - Watch Delegates
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    func sessionDidBecomeInactive(_ session: WCSession) { }
    func sessionDidDeactivate(_ session: WCSession) { }
        
    static let sharedInstance = WatchManager()
    
    override init() {
        super.init()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        
    }
    
    func send(recipe: RecipeModel) {
        WCSession.default.sendMessage(["recipe.data": recipe.toJson()], replyHandler: nil)
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        if !WCSession.default.isReachable {
            WCSession.default.activate()
        }
    }
        
}
