//
//  CashierLoginViewController.swift
//  GreyDemoApp
//
//  Created by Lorenzo Brown on 11/16/20.
//

import UIKit

class CashierLoginViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    var cashier : Cashier!
    var parentView:LoginViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.text = ""
        imageView.image = cashier.image
        welcomeLabel.text = "Welcome \(cashier.name!)!"

    }

    @IBAction func enterPasswordAction(_ sender: Any) {
        if passwordTextField.text == cashier.password {
            errorMessage.textColor = .green
            errorMessage.text = "Password Entered Successfully!"
            self.dismiss(animated: true, completion: self.loginUser)
           
        } else {
            errorMessage.textColor = .red
            errorMessage.text = "Password does not match"
        }
    }
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loginUser(){
        parentView.successfulLogin(cashier: self.cashier)
    }
}
