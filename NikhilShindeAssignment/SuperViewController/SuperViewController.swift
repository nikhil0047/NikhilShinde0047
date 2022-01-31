//
//  SuperViewController.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 27/01/22.
//

import UIKit
import Foundation
import MessageUI
import SVProgressHUD
class SuperViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        if WSHelper.sharedInstance.isNetworkReachable() {
            print("Reachable")
        }


        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
            
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
        
    
    func showProgressView()  {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
        
    }
    
  
    
    func hideProgressView(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
    
    func showAlertWithMessage(msg : String)
       {
           DispatchQueue.main.async {
               let alertController = UIAlertController(title: App_Alert, message:
                   msg, preferredStyle: UIAlertController.Style.alert)
               alertController.addAction(UIAlertAction(title: OK_STRING, style: UIAlertAction.Style.default,handler: nil))
               self.present(alertController, animated: true, completion: nil)
           }
       }
       
     
    
    func delay3Sec(closure:@escaping ()->())
    {
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    
    
   
}


extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
