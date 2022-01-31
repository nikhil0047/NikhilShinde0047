//
//  UserListViewController.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 27/01/22.
//

import UIKit
import MobileCoreServices
import SDWebImage
import MapKit


class UserListViewController: SuperViewController,UITableViewDelegate, UITableViewDataSource {
    var infoArr = [Users]()
    private var lastSelectedIndex = 0
    @IBOutlet var mainViewBG: UIView!
    @IBOutlet var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.dbViewModel.deleteRecord(user: MainResultResponse)
      
        self.getUserDefaultData()
        tblView.delegate = self
        tblView.dataSource = self
        print("Tableview")
        self.tblView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        getUserListData()
        getUserDefaultData()
    }
    //MARK: Network status
    func isNetworkReachable() -> Bool
    {
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            return false
        case .online(.wwan):
            return true
        case .online(.wiFi):
            return true
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return infoArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //dbViewModel.fetchUser()
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell") as! UserListTableViewCell
        let obj = infoArr[indexPath.row]
        cell.userImgView.sd_setImage(with: URL(string: "\(obj.picture?.medium ?? " ")"), placeholderImage: UIImage(named: "placeholder.png"))
        cell.lblUserName.text = "\("Name:") \(obj.name?.title ?? "" ) \(obj.name?.first ?? "" )  \(obj.name?.last ?? "")"
        cell.lblUserGender.text = "\("Gender:") \(obj.gender ?? "")"
        let annotation = MKPointAnnotation()
        let lat =  Double.init((obj.location?.coordinates?.latitude)!)
        let long = Double.init((obj.location?.coordinates?.longitude)!)
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
        annotation.title = obj.location?.country
        annotation.subtitle = obj.location?.city
        cell.mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: annotation.coordinate, span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
        cell.mapView.setRegion(region, animated: true)

        if !isNetworkReachable() {
            cell.mapView.removeFromSuperview()
                       
            }
      
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if !isNetworkReachable() {
        
            return 100
                       
            } else {
    return 200
    }
    }
   func getUserDefaultData(){
      // UserDefaults.standard.string(forKey: Userkey)
       
       if let storedObject: Data = UserDefaults.standard.data(forKey: "notes")
              {
                  do
                  {
                      infoArr = try PropertyListDecoder().decode([Users].self, from: storedObject)
                      for note in infoArr
                      {
                          print(note.name?.title!)
                          print(note.name?.first!)
                          print(note.name?.last!)
                          print(note.gender!)
                          print(note.location?.coordinates?.latitude!)
                          print(note.location?.coordinates?.longitude!)
                          print(note.picture?.medium!)
                          
                          
                      }
                  }
                  catch
                  {
                      print(error.localizedDescription)
                  }
              }
    }
    func getUserListData()
    {
        
     super.showProgressView()
      
        WSHelper.sharedInstance.getUserList(dict: [:]) { (respObj) in
            DispatchQueue.main.async {
                switch respObj {
                case .success(let dataObj):
                   
                    self.getUserListDataSuccessHandling(obj: dataObj)
                   
                    break
                case .failure(let eType, let errorMsg):
                    self.getUserListDataFailurehandling(eType: eType, errMsg: errorMsg)
                    super.hideProgressView()
                    break
                }
            }
        }
    }
    func getUserListDataSuccessHandling(obj:Any)
    {
       
        if let userResultObj = obj as? MainResultResponse
        {
            super.hideProgressView()
            self.infoArr = userResultObj.userList
          
         
          
            print("Record Saved@@@@@@@")
            
                do
                    {
                        UserDefaults.standard.set(try PropertyListEncoder().encode(infoArr), forKey: "notes")
                        UserDefaults.standard.synchronize()
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
         
           
            self.tblView.reloadData()
        }
    }
    func getUserListDataFailurehandling(eType:errorType,errMsg:String){
        super.hideProgressView()
        
        switch eType {
        case .ServerError:
            showAlertWithMessage(msg: errMsg.count > 0 ? errMsg : somethngWentWrng_Msg)
            self.getUserDefaultData()
            break
        case .NoInternet:
            showAlertWithMessage(msg: errMsg)
            self.getUserDefaultData()
            break
        case .none:
            showAlertWithMessage(msg: errMsg)
            self.getUserDefaultData()
            break
        }
    }

}
