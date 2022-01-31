//
//  SessionHandler.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 27/01/22.
//

import UIKit

class SessionHandler: NSObject {
    static let sharedInstance = SessionHandler()
    
    private override init() {
        super.init()
    }
    
    func chekSessionTimedOutForResp(respCode:Int)-> Int{
        if respCode == 401 {
            print("TimedOut")
            NotificationCenter.default.post(name: Notification.Name("navToLogin"), object: nil)
            return 1
        }else{
            return respCode
        }
    }
    
}
