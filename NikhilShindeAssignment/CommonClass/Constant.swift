//
//  Constant.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 27/01/22.
//

import Foundation


let BASE_URL = "https://randomuser.me/api/?results=1000"




//
let Session_Time_Out_Msg        = "Session Time Out, Please Login."
let somethngWentWrng_Msg        = "Something went wrong, Please try again later."
let No_Internet_Connection_Msg  = "No Internet Connection.\nPlease check internet connection"
let App_Alert                   = "App Alert"
let No_Net_Alert                = "You are not connected to internet. Please try again later."

let OK_STRING                   = "OK"
let Cancel_STRING               = "Cancel"
let Retry_STRING               = "Retry"
enum responseObject {
    case success(Any)
    case failure(errorType,String)
}
enum errorType{
    case NoInternet
    case ServerError
    case none
}

