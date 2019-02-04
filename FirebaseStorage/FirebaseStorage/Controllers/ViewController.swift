//
//  ViewController.swift
//  FirebaseStorage
//
//  Created by Sunil on 04/02/19.
//  Copyright © 2019 Sunil. All rights reserved.
//

import UIKit

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

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

