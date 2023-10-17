//
//  LoginVC.swift
//  uia
//
//  Created by EMPULSE on 19/09/23.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var loginLable: UILabel!
    @IBOutlet weak var imageAndLoginContainer: UIView!
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var userNameContainerView: UIView!
    @IBOutlet weak var userNameValiationContainer: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var buttonViewContainerView: UIView!
    @IBOutlet weak var nameValidateView: UIView!
    @IBOutlet weak var passwordValidateView: UIView!
    @IBOutlet weak var showPasswordContainerView: UIView!
    @IBOutlet weak var nameValidateImage: UIImageView!
    @IBOutlet weak var passwordValidateImage: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginLogoImageView: UIImageView!
    @IBOutlet weak var showPasswordAndHidePasswordImage: UIImageView!
    @IBOutlet weak var signUpBnt: UIButton!
    let isUserLoggedIn = true // make this true whenever use click on the remember button
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    func setUI(){
        view.applyLinearGradient(hexColors: linearColorArray)
        userNameContainerView.roundRadius(radiusValue: 25, borderWidth: 1.4)
        userNameContainerView.addShadow()
//        userNameContainerView = roundRadius(passview: userNameContainerView, radiusValue: 25, borderWidth: 1.4)
        passwordContainerView = roundRadius(passview: passwordContainerView, radiusValue: 25, borderWidth: 1.4)
        buttonViewContainerView = roundRadius(passview: buttonViewContainerView, radiusValue: 25, borderWidth: 0.0)
        addShadow(to: userNameContainerView)
        addShadow(to: passwordContainerView)
        addShadow(to: buttonViewContainerView)
        buttonViewContainerView.backgroundColor = UIColor(named: "LoginButton")
        signUpBnt.setAttributedTitle("Sign Up".underLined, for: .normal)
    }
    
    @IBAction func showAndHidePasswordOnCLick(_ sender: UIButton){
        
    }
    @IBAction func forgotPasswordOnClick(_ sender: UIButton){
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    @IBAction func loginBtnOnClick(_ sender: UIButton){
        appDelegate.window?.rootViewController = tabBarControllers
        appDelegate.window?.makeKeyAndVisible()
    }
    @IBAction func signUpOnClick(_ sender: UIButton){
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
}
