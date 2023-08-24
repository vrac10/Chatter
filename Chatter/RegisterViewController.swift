//
//  RegisterViewController.swift
//  Chatter
//
//  Created by Rachit verma on 20/08/23.
//

import UIKit
import Firebase
import FirebaseAuth
import ProgressHUD

class RegisterViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Register View Controller!\n")
        
    }
    
    @IBAction func backToLogIn(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        guard let email = emailTextField.text, let name = nameTextField.text, let password = passTextField.text, !email.isEmpty,!name.isEmpty,!password.isEmpty else{
            
            let alert_err = UIAlertController(title: "ERROR", message: "Please enter all details", preferredStyle: .alert)
            
            alert_err.addAction(UIAlertAction(title: "Ok", style: .default))
            
            present(alert_err, animated: true)
            
            return
        }
            ProgressHUD.showProgress("Loading...", 0.80)
            ProgressHUD.animationType = .circleStrokeSpin
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passTextField.text!) { [weak self] authresult, error in
                
                guard let strongSelf = self else{
                    return
                }
                if(error != nil){
                    let alert = UIAlertController(title: "ERROR", message: error?.localizedDescription, preferredStyle: .alert)
                    ProgressHUD.dismiss()
                    alert.addAction(UIAlertAction(title: "Retry", style: .default))
                    alert.addAction(UIAlertAction(title: "Login", style: .default))
                    strongSelf.present(alert, animated: true)
                   
                    
                }
                else{
                    guard let result = authresult else{
                        return
                    }
                    DataBaseManager.shared.insertUser(with: ChatterUser(name: name, email: email, uid: result.user.uid))
                    
                    ProgressHUD.remove()
                    strongSelf.dismiss(animated: true)
                    

                }
            }
            
            
        }
    }
    

