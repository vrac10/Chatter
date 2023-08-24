//
//  ViewController.swift
//  Chatter
//
//  Created by Rachit verma on 20/08/23.
//

import UIKit
import Firebase
import FirebaseAuth
import ProgressHUD

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func toRegister(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toRegister", sender: self)
        
    }
    
    
    @IBAction func logInButton(_ sender: UIButton) {
        if(emailTextField.text != nil && passTextField.text != nil){
            
            ProgressHUD.showProgress("Loading...", 0.90)
            ProgressHUD.animationType = .circleRotateChase
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passTextField.text!) { [weak self] result, error in
                guard let strongSelf = self else{
                    return
                }
                
                
                if(error != nil){
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Retry", style: .default))
                    ProgressHUD.remove()
                    strongSelf.present(alert,animated: true)
                }
                else{
                    print("You were successfully logged in.")
                    ProgressHUD.showSuccess("Logged In")
                    strongSelf.dismiss(animated: true)
                }
            }
        }
    }
    
}

