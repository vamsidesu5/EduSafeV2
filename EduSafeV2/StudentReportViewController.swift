//
//  StudentSendReportViewController.swift
//  EduSafeV2
//
//  Created by vamsi on 2/24/18.
//  Copyright © 2018 zav. All rights reserved.
//

import UIKit

class StudentReportViewController: UIViewController {
    var urgency = 1
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var descriptionTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextField.layer.borderWidth = 1

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendAlertButtonPressed(_ sender: Any) {
        let description = descriptionTextField.text

        // send the description and the urgency to the server

        if description != nil{
            let methods = AFMethods()
            methods.postMessage(content: description!, urgency: urgency, completion: { status in
                if status == "Success"{
                    let alert = UIAlertController(title: "Success", message: "Message has been sent", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.descriptionTextField.text = ""

                }else{
                    let alert = UIAlertController(title: "Failure", message: "An error occured", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }

            })

        }
    }
    
    @IBAction func changedSegmentedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            urgency = 1

        case 1:
            urgency = 2

        case 2:
            urgency = 3

        default:
            break
        }
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
