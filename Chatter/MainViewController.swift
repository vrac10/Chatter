//
//  MainViewController.swift
//  Chatter
//
//  Created by Rachit verma on 21/08/23.
//

import UIKit
import Firebase
import FirebaseAuth



class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         // Do any additional setup after loading the view.
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let cu = Auth.auth().currentUser
        if(cu == nil){
            performSegue(withIdentifier: "toLogin", sender: self)
        }
    }
    

    /*
    // MARK: - Navigatione

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
