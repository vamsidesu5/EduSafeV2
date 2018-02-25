//
//  AFLogin.swift
//  EduSafeV2
//
//  Created by Andrew Song on 2/24/18.
//  Copyright © 2018 zav. All rights reserved.
//

import Foundation
import Alamofire

struct AFMethods{

    let endpoint = "hello" // Change this to the url

    func loginStudent(username: String, password: String) -> Bool{

        let loginInfo: [String: Any] = ["username": username, "password": password]
        let updatedEP = endpoint + "/user/loginStudent/"

        var status: String = ""

        Alamofire.request(updatedEP, method: .put, parameters: loginInfo, encoding: JSONEncoding.default)
        .responseJSON { response in
            guard response.result.error == nil else {
                print("error")
                print(response.result.error!)
                return
            }
            guard let json = response.result.value as? String else {
                print("didn't get todo object as JSON from API")
                print("Error: \(response.result.error!)")
                return
            }
            status = json
        }

        if status == "Login Success"{
            return true
        }
        return false
    }

    func loginAdmin(name: String, password: String) -> Bool{

        let loginInfo: [String: Any] = ["name": name, "password": password]
        let updatedEP = endpoint + "/user/loginAdmin/"

        var status: String = ""

        Alamofire.request(updatedEP, method: .put, parameters: loginInfo, encoding: JSONEncoding.default)
            .responseJSON { response in
                guard response.result.error == nil else {
                    print("There is an error")
                    print(response.result.error!)
                    return
                }
                guard let json = response.result.value as? String else {
                    print("didn't get todo object as JSON from API")
                    print("Error: \(response.result.error!)")
                    return
                }
                status = json
        }

        if status == "Login Success"{
            return true
        }
        return false

    }

    func postMessage(content: String, urgency: Int){

        let messageInfo: [String: Any] = ["content": content, "urgency": urgency]
        let updatedEP = endpoint + "/message/postMessage/"

        Alamofire.request(updatedEP, method: .post, parameters: messageInfo, encoding: JSONEncoding.default)
            .responseJSON { response in

                guard response.result.error == nil else{
                    print("There is an error")
                    print(response.result.error!)
                    return
                }

        }

    }

    func displayFeed(){



    }

    func approveMessage(username: String, password: String){

    }


}



