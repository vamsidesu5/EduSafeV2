//
//  AdministratorReportViewController.swift
//  EduSafeV2
//
//  Created by vamsi on 2/24/18.
//  Copyright © 2018 zav. All rights reserved.
//

// Vamsi is a butt

import UIKit

class AdministratorReportViewController: UIViewController {
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var urgency = 1;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendNotificationsButtonPressed(_ sender: Any) {
        //send notification to all people
    }
    @IBAction func markReadButtonPressed(_ sender: Any) {
        let description = descriptionTextField.text;
        //send the description and the urgency to the server
    }
    @IBAction func changedSegmentedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            urgency = 1;
        case 1:
            urgency = 2;
        case 2:
            urgency = 3;
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
