//
//  SignUpVC.swift
//  uia
//
//  Created by EMPULSE on 20/09/23.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var fullNameContainer: UIView!
    @IBOutlet weak var emailContainer: UIView!
    @IBOutlet weak var designation: UIView!
    @IBOutlet weak var btnContainer: UIView!
    @IBOutlet weak var mobileNoContainer: UIView!
    @IBOutlet weak var subContainerView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var designationTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var validationView: UIView!
    @IBOutlet weak var validationImageView: UIImageView!
    @IBOutlet weak var signUpViewContainer: UIView!
    @IBOutlet weak var signInNowBtn: UIButton!
    @IBOutlet weak var roleBtn: UIButton!
   
    
    @IBOutlet var viewD: DropdownView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    func setUI() {
        view.applyLinearGradient(hexColors: linearColorArray)
        fullNameContainer = roundRadius(passview: fullNameContainer, radiusValue: 12, borderWidth: 1.4)
        emailContainer = roundRadius(passview: emailContainer, radiusValue: 12, borderWidth: 1.4)
        designation = roundRadius(passview: designation, radiusValue: 12, borderWidth: 1.4)
        mobileNoContainer.roundRadius(radiusValue: 12, borderWidth: 1.4)
        addShadow(to: fullNameContainer)
        addShadow(to: emailContainer)
        addShadow(to: designation)
        addShadow(to: btnContainer)
        signInNowBtn.setAttributedTitle("Sign in Now".underLined, for: .normal)
        roleBtn.setTitle("", for: .normal)
        
       

                // Set options for the dropdown
        
        viewD.options = ["Option 1", "Option 2", "Option 3","Option 1", "Option 2", "Option 3"]
//        viewD.containerView = subContainerView
        

    }
    
    @IBAction func signIn(_ sender: UIButton){
        navigationController?.popViewController(animated: false)
    }
    @IBAction func role(_ sender: UIButton){
        print("Role Button is clicked")
       
    }
}
