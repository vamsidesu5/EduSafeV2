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

    func loginStudent(username: String, password: String){

        let loginInfo: [String: Any] = ["username": username, "password": password]


    }

    func loginAdmin(name: String, password: String){


    }

    func postMessage(content: String, urgency: Int){

        let messageInfo: [String: Any] = ["content": content, "urgency": urgency]

    }

    func displayFeed(){



    }

    func approveMessage(username: String, password: String){

    }


}



