//
//  UserListResponseObject.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 27/01/22.
//


import Foundation
import ObjectMapper
struct MainResultResponse : Codable,Mappable {
    
    
    var userList : [Users]!
    var info : Info?
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case userList = "results"
        case info = "info"
    }
    mutating func mapping(map: Map) {
        userList <- map["results"]
       info <- map["info"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userList = try values.decodeIfPresent([Users].self, forKey: .userList)
        info = try values.decodeIfPresent(Info.self, forKey: .info)
    }

}

struct Users : Codable, Mappable {
    var gender : String?
    var name : Name?
    var location : Location?
    var email : String?
    var login : Login?
    var dob : Dob?
    var registered : Registered?
    var phone : String?
    var cell : String?
    var id : Id?
    var picture : Picture?
    var nat : String?
   
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case gender = "gender"
        case name = "name"
        case location = "location"
        case email = "email"
        case login = "login"
        case dob = "dob"
        case registered = "registered"
        case phone = "phone"
        case cell = "cell"
        case id = "id"
        case picture = "picture"
        case nat = "nat"
    }
    mutating func mapping(map: Map) {
       gender <- map["gender"]
       name <- map["name"]
       location <- map["location"]
       email <- map["email"]
       login <- map["login"]
       dob <- map["dob"]
       registered <- map["registered"]
       phone <- map["phone"]
       cell <- map["cell"]
       id <- map["id"]
       picture <- map["picture"]
       nat <- map["nat"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        name = try values.decodeIfPresent(Name.self, forKey: .name)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        login = try values.decodeIfPresent(Login.self, forKey: .login)
        dob = try values.decodeIfPresent(Dob.self, forKey: .dob)
        registered = try values.decodeIfPresent(Registered.self, forKey: .registered)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        cell = try values.decodeIfPresent(String.self, forKey: .cell)
        id = try values.decodeIfPresent(Id.self, forKey: .id)
        picture = try values.decodeIfPresent(Picture.self, forKey: .picture)
        nat = try values.decodeIfPresent(String.self, forKey: .nat)
    }

}
struct Info : Codable, Mappable {
    var seed : String?
    var results : Int?
    var page : Int?
    var version : String?
   
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case seed = "seed"
        case results = "results"
        case page = "page"
        case version = "version"
    }
    mutating func mapping(map: Map) {
        
        seed <- map["seed"]
        results <- map["results"]
        page <- map["page"]
        version <- map["version"]
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        seed = try values.decodeIfPresent(String.self, forKey: .seed)
        results = try values.decodeIfPresent(Int.self, forKey: .results)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        version = try values.decodeIfPresent(String.self, forKey: .version)
    }

}
struct Name : Codable, Mappable {
    var title : String?
    var first : String?
    var last : String?
    
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case title = "title"
        case first = "first"
        case last = "last"
    }
   mutating func mapping(map: Map) {
       title <- map["title"]
       first <- map["first"]
       last <- map["last"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        first = try values.decodeIfPresent(String.self, forKey: .first)
        last = try values.decodeIfPresent(String.self, forKey: .last)
    }

}
struct Location : Codable, Mappable {
    var street : Street?
    var city : String?
    var state : String?
    var country : String?
    var postcode : Int?
    var coordinates : Coordinates?
    var timezone : Timezone?
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case street = "street"
        case city = "city"
        case state = "state"
        case country = "country"
        case postcode = "postcode"
        case coordinates = "coordinates"
        case timezone = "timezone"
    }
   mutating func mapping(map: Map) {
       street <- map["street"]
       city <- map["city"]
       state <- map["state"]
       country <- map["country"]
       postcode <- map["postcode"]
       coordinates <- map["coordinates"]
       timezone <- map["timezone"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(Street.self, forKey: .street)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        postcode = try values.decodeIfPresent(Int.self, forKey: .postcode)
        coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coordinates)
        timezone = try values.decodeIfPresent(Timezone.self, forKey: .timezone)
    }

}
struct Login : Codable, Mappable {
    var uuid : String?
    var username : String?
    var password : String?
    var salt : String?
    var md5 : String?
    var sha1 : String?
    var sha256 : String?
    
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case uuid = "uuid"
        case username = "username"
        case password = "password"
        case salt = "salt"
        case md5 = "md5"
        case sha1 = "sha1"
        case sha256 = "sha256"
    }
 mutating func mapping(map: Map) {

       uuid <- map["uuid"]
       username <- map["username"]
       password <- map["password"]
       salt <- map["salt"]
       md5 <- map["md5"]
       sha1 <- map["sha1"]
       sha256 <- map["sha256"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        salt = try values.decodeIfPresent(String.self, forKey: .salt)
        md5 = try values.decodeIfPresent(String.self, forKey: .md5)
        sha1 = try values.decodeIfPresent(String.self, forKey: .sha1)
        sha256 = try values.decodeIfPresent(String.self, forKey: .sha256)
    }

}
struct Dob : Codable, Mappable {
    var date : String?
    var age : Int?

    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case date = "date"
        case age = "age"
    }
   mutating func mapping(map: Map) {

       date <- map["date"]
       age <- map["age"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
    }

}
struct Registered : Codable, Mappable {
    var date : String?
    var age : Int?

    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case date = "date"
        case age = "age"
    }

  mutating  func mapping(map: Map) {

       date <- map["date"]
       age <- map["age"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
    }

}
struct Id : Codable, Mappable {
    var name : String?
    var value : String?

    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case name = "name"
        case value = "value"
    }
   mutating func mapping(map: Map) {

       name <- map["name"]
       value <- map["value"]
   }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        value = try values.decodeIfPresent(String.self, forKey: .value)
    }

}
struct Picture : Codable , Mappable{
    var large : String?
    var medium : String?
    var thumbnail : String?
    
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case large = "large"
        case medium = "medium"
        case thumbnail = "thumbnail"
    }
  mutating  func mapping(map: Map) {

       large <- map["large"]
       medium <- map["medium"]
       thumbnail <- map["thumbnail"]
   }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        large = try values.decodeIfPresent(String.self, forKey: .large)
        medium = try values.decodeIfPresent(String.self, forKey: .medium)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
    }

}
struct Coordinates : Codable, Mappable {
    var latitude : String?
    var longitude : String?
   
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case latitude = "latitude"
        case longitude = "longitude"
    }

   mutating func mapping(map: Map) {

       latitude <- map["latitude"]
       longitude <- map["longitude"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
    }

}
struct Street : Codable , Mappable{
    var number : Int?
    var name : String?

    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case number = "number"
        case name = "name"
    }
   mutating func mapping(map: Map) {

       number <- map["number"]
       name <- map["name"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
struct Timezone : Codable, Mappable {
    var offset : String?
    var description : String?
   
    init?(map: Map) {
       
    }
    enum CodingKeys: String, CodingKey {

        case offset = "offset"
        case description = "description"
    }
 mutating   func mapping(map: Map) {

       offset <- map["offset"]
       description <- map["description"]
   }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        offset = try values.decodeIfPresent(String.self, forKey: .offset)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}
