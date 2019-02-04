//
//  ViewController.swift
//  FirebaseStorage
//
//  Created by Sunil on 04/02/19.
//  Copyright © 2019 Sunil. All rights reserved.
//

import UIKit

import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textName: UITextField!

    @IBOutlet weak var textLoginPassword: UITextField!
    @IBOutlet weak var textLoginEmail: UITextField!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var registerStackView: UIStackView!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pageRefresh(_ sender: UISegmentedControl) {
        sender.isSelected = true
        if sender.selectedSegmentIndex == 0 {
            loginStackView.isHidden = false
            registerStackView.isHidden = true
        }else{
            loginStackView.isHidden = true
            registerStackView.isHidden = false
        }

    }
   
    @IBAction func submitButtonPressed(_ sender: Any) {

        if segmentedControl.selectedSegmentIndex == 0 {

            if textLoginEmail.text?.count == 0 || textLoginPassword.text?.count == 0
            {
                showingAlert(message: "Please enter all fields")
            }else {
                Auth.auth().signIn(withEmail: textLoginEmail.text ?? "sunil@firebase.com", password: textLoginPassword.text ?? "1234") { (authDataResults, error) in

                    if error != nil {
                        print(error)
                        return
                    }
                     self.showingAlert(message: "successfully user created \(authDataResults?.user.email)")
                }
            }

        }else {

            if textName.text?.count == 0 || textPassword.text?.count == 0 || textEmail.text?.count == 0
            {
                showingAlert(message: "Please enter all fields")
            } else {
                Auth.auth().createUser(withEmail: textEmail.text ?? "sunil@firebase.com", password: textPassword.text ?? "1234") { (userDetails, error) in
                    let userData = userDetails
                    if error != nil {
                        print(error)
                        return
                    }

                    guard (userData?.user.uid) != nil else
                    {
                        self.showingAlert(message: "user not created")
                        return
                    }
                     self.showingAlert(message: "successfully user created \(userData?.user.email)")

                }
            }
        }
    }

    func showingAlert(message : String) {
        let alertViewController = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "OK", style: .default) { (alert) in
        }
        alertViewController.addAction(alertAction)
        self.present(alertViewController, animated: true) {

        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

