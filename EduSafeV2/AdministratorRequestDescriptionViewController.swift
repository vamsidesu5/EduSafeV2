//
//  AdministratorRequestDescriptionViewController.swift
//  EduSafeV2
//
//  Created by vamsi on 2/25/18.
//  Copyright © 2018 zav. All rights reserved.
//

import UIKit

class AdministratorRequestDescriptionViewController: UIViewController {
    @IBOutlet weak var descriptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //descriptionTextField.text = requests[myIndex2]
        // Fix later
        descriptionTextField.text = requests[myIndex2].getContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func dismissButtonPressed(_ sender: Any) {
        //Remove request which is gonna look like requests[myIndex2].getID()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sendNotificationsButtonPressed(_ sender: Any) {
        //Add request to descriptions
        self.dismiss(animated: true, completion: nil)
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
