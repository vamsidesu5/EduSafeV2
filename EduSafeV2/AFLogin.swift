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

    func postMessage(content: String, urgency: Int, completion: @escaping (String?) -> ()){

        let messageInfo: [String: Any] = ["content": content, "urgent": urgency]
        let updatedEP = endpoint + "/message/postMessage/"

        var status: String = ""

        Alamofire.request(updatedEP, method: .post, parameters: messageInfo, encoding: JSONEncoding.default)
            .responseJSON { response in

                if let json = response.result.value{
                    status = json as! String
                } else {
                    print("didn't get object from API")
                    print("Error: \(response.result.error!)")
                    return
                }

                status = status.replacingOccurrences(of: "\"", with: "")

                completion(status)

        }

    }

    func createFeed(){

        let updatedEP = endpoint + "/users/seeMessages/"

        guard let url = URL(string: updatedEP) else {
            print("Could not get URL")
            return
        }

        URLSession.shared.dataTask(with: url){
            (data, response, err) in
            guard let data = data else {return}
            do {
                let jsonObjects = try JSONDecoder().decode([FeedObjects].self, from: data)
                for message in jsonObjects{
                    requestFeed.append(message)
                    print(message.getContent())
                }
            } catch let jsonErr{
                print("Error serializing JSON", jsonErr)
            }
        }.resume()

    }

    func approveMessage(message_id:Int, completion: @escaping (String?) -> ()){

        let updatedEP = endpoint + "/users/approveMessage/"
        let messageInfo: [String: Any] = ["message_id": message_id]

        var status = ""

        Alamofire.request(updatedEP, method: .put, parameters: messageInfo, encoding: JSONEncoding.default)
            .responseJSON { response in

                if let json = response.result.value{
                    status = json as! String
                } else {
                    print("didn't get object from API")
                    print("Error: \(response.result.error!)")
                    return
                }

                status = status.replacingOccurrences(of: "\"", with: "")

                completion(status)

        }

    }


}



