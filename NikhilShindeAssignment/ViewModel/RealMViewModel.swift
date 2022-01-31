//
//  RealMViewModel.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 28/01/22.
//

import RealmSwift
import UIKit

// MARK: DB protocol Methods

protocol RealMViewModelDelegate {
    func RecordSaved()
    func RecordSavingFailed(error: NSError)
    func RecordFetched(users: [Users])
    func RecordDeleted()
}

// Make RealMViewModelDelegate methods optionals
extension RealMViewModelDelegate {
    func RecordSaved() {}
    func RecordSavingFailed(error: NSError) {}
    func RecordFetched(users: [Users]) {}
    func RecordDeleted(){}
}

class RealMViewModel: NSObject {
    let realm = try! Realm()
    var delegate: RealMViewModelDelegate?

    // MARK: DB Helper Methods
  
    func saveRecord(user: [Users]) {
        
        
       // let tempList = Users()
      //  UserDefaults.standard.set(tempList, forKey: "Key")
        
        // Persist your data easily
//        try! realm.write {
//            realm.add(user)
//            print(realm.configuration.fileURL!)
//            //delegate?.RecordSaved() // Notify for succesful insertion
//        }
        // Note: here we can handle error in catch block and notify using
        // RecordSavingFailed(error: NSError)
    }
    
    func fetchUser(){
//        let users = realm.objects([Results])
//        if users.count > 0 {
//            var dumppyUsers = [Results]()
//            for user in users {
//                dumppyUsers.append(user)
//            }
//            delegate?.RecordFetched(users: dumppyUsers) // Notify with records
//        } else {
//            delegate?.RecordFetched(users: [])
//        }
        print("Test")
       // delegate?.RecordFetched(users: [])
    }
    
   /* func deleteRecord(user: MainResultResponse) {
           // Persist your data easily
           try! realm.write {
               realm.delete(user.userList)
               delegate?.RecordDeleted() // Notify for succesful deletion
           }
       }*/
}

