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

    let endpoint = "http://2c3eb790.ngrok.io" // Change this to the url

    func loginStudent(student_id: String, password: String, completion: @escaping (String?) -> ()){

        let loginInfo: [String: Any] = ["student_id": student_id, "password": password]
        let updatedEP = endpoint + "/users/loginStudent/"

        var status: String = ""

        Alamofire.request(updatedEP, method: .put, parameters: loginInfo, encoding: JSONEncoding.default)
            .responseString { response in

                if let json = response.result.value{
                    status = json
                } else {
                    print("didn't get object from API")
                    print("Error: \(response.result.error!)")
                    return
                }

                status = status.replacingOccurrences(of: "\"", with: "")
                print(status)
                completion(status)
        }
    }

    func loginAdmin(name: String, password: String, completion: @escaping (String?) -> ()){

        let loginInfo: [String: Any] = ["name": name, "password": password]
        let updatedEP = endpoint + "/users/loginAdmin/"

        var status: String = ""

        Alamofire.request(updatedEP, method: .put, parameters: loginInfo, encoding: JSONEncoding.default)
            .responseString { response in

                if let json = response.result.value{
                    status = json
                } else {
                    print("didn't get object from API")
                    print("Error: \(response.result.error!)")
                    return
                }

                status = status.replacingOccurrences(of: "\"", with: "")

                completion(status)
        }
    }

    func postMessage(content: String, urgency: Int, completion: @escaping (Bool?) -> ()){

        let messageInfo: [String: Any] = ["content": content, "urgency": urgency]
        let updatedEP = endpoint + "/message/postMessage/"

        var success = false

        Alamofire.request(updatedEP, method: .post, parameters: messageInfo, encoding: JSONEncoding.default)
            .responseJSON { response in

                guard response.result.error == nil else{
                    print("There is an error")
                    print(response.result.error!)
                    return
                }
                success = true
                completion(success)

        }

    }

    func displayFeed(){



    }

    func approveMessage(username: String, password: String){

    }


}



