//
//  WSHelper.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 27/01/22.
//

import Foundation
import Alamofire
import ObjectMapper


class WSHelper: NSObject {
    static let sharedInstance = WSHelper()
    
    //MARK: Init class
    private override init() {
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        super.init()
    }
    
    func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]


        return headers
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
    
    
    //************************************  Api's include here *************************************
    
    func getUserList(dict: Dictionary<String, Any>,completion: @escaping (responseObject) -> ()){
        
        commonWebServiceCallForAPI(api: BASE_URL , httpType: .get, dict: [:]) { (obj) in
            switch obj {
            case .success(let respObj):
                let resp = respObj as! AFDataResponse<Any>
                let bodyString = String.init(data: resp.data!, encoding: String.Encoding.utf8)!
                let UserListResp = Mapper<MainResultResponse>().map(JSONString: bodyString)
                completion(.success(UserListResp!))
                break
            case .failure(let type, let msg):
                completion(.failure(type, msg))
            }
        }
    }
    func commonWebServiceCallForAPI(api:String,httpType:HTTPMethod, dict:Parameters? , completion: @escaping (responseObject) -> ()) {
        if isNetworkReachable()
        {
            
            var param = dict
            if param!.count == 0 {
                param = nil
            }
            
            AF.request(api, method: httpType, parameters: param , encoding: JSONEncoding.default, headers:headers())
                .responseJSON { response in
                    if response.data != nil {
                        switch SessionHandler.sharedInstance.chekSessionTimedOutForResp(respCode:response.response!.statusCode)
                        {
                        case 200:
                            completion(.success(response))
                        case 1:
                            break
                        default :
                            completion(.failure(.ServerError, response.error != nil ?response.error!.localizedDescription:somethngWentWrng_Msg ))
                            
                        }
                    }else{
                        if response.response != nil {
                            let code = SessionHandler.sharedInstance.chekSessionTimedOutForResp(respCode:response.response!.statusCode)
                            if code == 1 {
                                print("Session Timeout")
                            }else{
                                completion(.failure(.none, response.error != nil ?response.error!.localizedDescription:somethngWentWrng_Msg ))
                            }
                        }else{
                            completion(.failure(.none, response.error != nil ?response.error!.localizedDescription:somethngWentWrng_Msg ))
                        }
                    }
            }
        }
        else
        {
            completion(.failure(.NoInternet, No_Internet_Connection_Msg))
        }
    }
}


