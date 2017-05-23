//
//  LiftSignInViewController.swift
//  Lift
//
//  Created by RadhikaX M V on 4/5/17.
//  Copyright © 2017 RadhikaX M V. All rights reserved.
//

import UIKit

class LiftSignInViewController: UIViewController {

    @IBOutlet weak var googlePlusButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor(patternImage: UIImage(named: "LaunchImage")!)
        roundedCorner(button: signInButton, cornerRadius: 5, cornerWidth: 1)
        
        userNameTextField.setBottomBorder(color: "#3EFE46")
        passwordTextField.setBottomBorder(color: "#3EFE46")
        
        userNameTextField.leftView = placeHolderImage(imageName: "userIcon")
        userNameTextField.leftViewMode = UITextFieldViewMode.always
        
        passwordTextField.leftView = placeHolderImage(imageName: "passwordIcon")
        passwordTextField.leftViewMode = UITextFieldViewMode.always

    }
    @IBAction func onClickingGooglePlusButton(_ sender: Any) {
    }

    @IBAction func onClickingFacebookButton(_ sender: Any) {
    }
    @IBAction func onClickingRegisterButton(_ sender: Any) {
    }
    @IBAction func onClickingPasswordButton(_ sender: Any) {
    }
    @IBAction func onClickingSignInButton(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func roundedCorner(button:UIButton, cornerRadius:CGFloat, cornerWidth:CGFloat)  {
        button.layer.cornerRadius = cornerRadius
        //button.layer.borderWidth = cornerWidth
        //button.layer.borderColor = UIColor.black.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
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
