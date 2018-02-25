//
//  StudentLoginViewController.swift
//  EduSafeV2
//
//  Created by vamsi on 2/24/18.
//  Copyright © 2018 zav. All rights reserved.
//

import UIKit

class StudentLoginViewController: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let name = userTextField.text;
        let password = passTextField.text;

        if name != nil && password != nil{
            print(name!)
            print(password!)
            let methods = AFMethods()
            methods.loginStudent(student_id: name!, password: password!, completion: { status in
                if status == "Login Success"{
                    self.performSegue(withIdentifier: "segue", sender: self)

                }else{
                    print("Failure")
                }
            })
        }

    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
