//
//  LiftRegisterViewController.swift
//  Lift
//
//  Created by RadhikaX M V on 4/5/17.
//  Copyright © 2017 RadhikaX M V. All rights reserved.
//

import UIKit

class LiftRegisterViewController: UIViewController {
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!

    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor(patternImage: UIImage(named: "registerBackground")!)
        createAccountButton.layer.cornerRadius = 15
        createAccountButton.layer.borderWidth = 1
        createAccountButton.layer.borderColor = UIColor.white.cgColor
        
        firstNameTextField.setBottomBorder(color: "#3EFE46")
        
        lastNameTextField.setBottomBorder(color: "#3EFE46")
        
        passwordTextField.setBottomBorder(color: "#3EFE46")
        
        confirmPasswordTextField.setBottomBorder(color: "#3EFE46")
        
        emailTextField.setBottomBorder(color: "#3EFE46")
        
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        imageView.image = UIImage(named: "male")
        
        
        
        firstNameTextField.leftView = placeHolderImage(imageName: "userIcon")
        firstNameTextField.leftViewMode = UITextFieldViewMode.always
        
        emailTextField.leftView = placeHolderImage(imageName: "emailIcon")
        emailTextField.leftViewMode = UITextFieldViewMode.always
        
        passwordTextField.leftView = placeHolderImage(imageName: "passwordIcon")
        passwordTextField.leftViewMode = UITextFieldViewMode.always
        
        confirmPasswordTextField.leftView = placeHolderImage(imageName: "passwordIcon")
        confirmPasswordTextField.leftViewMode = UITextFieldViewMode.always

    }
    @IBAction func onClickingCreateAccountButton(_ sender: UIButton) {
    }

    @IBAction func onClickingFemaleButton(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected=true
        }else{
            sender.isSelected=false;
        }
    }
    @IBAction func onClickingMaleButton(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected=true
        }else{
            sender.isSelected=false;
        }

    }
    @IBAction func onClickingCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//extension UITextField {
//    func setBottomBorder() {
//        self.borderStyle = .none
//        self.layer.backgroundColor = UIColor.white.cgColor
//        
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.gray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        self.layer.shadowOpacity = 1.0
//        self.layer.shadowRadius = 0.0
//    }
//}
extension UITextField
{
    func setBottomBorder(color:String)
    {
        self.borderStyle = .none
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}

    public func placeHolderImage(imageName:String) -> UIImageView
    {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        
        return imageView;
    }

