//
//  Micros.swift
//  uia
//
//  Created by EMPULSE on 19/09/23.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let window = UIWindow(frame: UIScreen.main.bounds)

//let tabBarControllers = MainTabBarController()

let linearColorArray = [UIColor(named: "LinearGradentTop"),UIColor(named: "LinearGradentMiddel"),UIColor(named: "LinearGradentButtom")]

let storyBord = UIStoryboard(name: "Main", bundle: nil)
let navLoginNavigation: UINavigationController = storyBord.instantiateViewController(withIdentifier: "idNavLoginVC") as! UINavigationController
let navHomeNavigation: UINavigationController = storyBord.instantiateViewController(withIdentifier: "idNavHomeVC") as! UINavigationController
//let navMyProfileVC: UINavigationController = storyBord.instantiateViewController(withIdentifier: "idNavMyProfileVC") as! UINavigationController
let launchScreenVC = storyBord.instantiateViewController(withIdentifier: "idLaunchScreenVC") as! LaunchScreenController
let loginVC = storyBord.instantiateViewController(withIdentifier: "idLoginVC") as! LoginController
let signUpVC = storyBord.instantiateViewController(withIdentifier: "idSignUpVC") as! SignUpVC
let forgotPasswordVC = storyBord.instantiateViewController(withIdentifier: "idForgotPasswordVC") as! ForgotPasswordVC
let tabBarControllers = storyBord.instantiateViewController(withIdentifier: "idMainTabBarController") as! MainTabBarController
let settingsViewController = storyBord.instantiateViewController(withIdentifier: "isSettingsViewController") as! SettingsViewController
let myProfileVC = storyBord.instantiateViewController(withIdentifier: "idMyProfileVC") as! MyProfileVC
let notificationVC = storyBord.instantiateViewController(withIdentifier: "idNotificationViewController") as! NotificationViewController
//let loaderVC = storyBord.instantiateViewController(withIdentifier: "idLoaderViewController") as! LoaderViewController
let scanListVC = storyBord.instantiateViewController(withIdentifier: "idScanListViewController") as! ScanListViewController


let myProfileTVC = UINib(nibName: "MyProfileTVC", bundle: nil)
let textFieldTVC = UINib(nibName: "TextFieldTVC", bundle: nil)
let dropdownTVC = UINib(nibName: "DropdownTVC", bundle: nil)
let textViewTVC = UINib(nibName: "TextViewTVC", bundle: nil)
let passwordTextFieldTVC = UINib(nibName: "PasswordTextFieldTVC", bundle: nil)
let buttonTVC = UINib(nibName: "ButtonTVC", bundle: nil)
let filterListTableCell = UINib(nibName: "FilterListTableViewCell", bundle: nil)
let inspectionTVC = UINib(nibName: "InspectionTVC", bundle: nil)
let scanListTableCell = UINib(nibName: "ScanListTableViewCell", bundle: nil)
let reportTableCell = UINib(nibName: "ReportTVC", bundle: nil)
let rejectButtonTVC = UINib(nibName: "RejectButtonTVC", bundle: nil)
var isQrScanned = false
func roundRadius<T: UIView>(passview: T, radiusValue: CGFloat, borderWidth: CGFloat) -> T{
    let rView = passview
    rView.layer.cornerRadius = radiusValue
    rView.layer.borderWidth = borderWidth
    return rView
}

func addShadow(to view: UIView, color: UIColor = .black, opacity: Float = 0.7, offset: CGSize = CGSize(width: 0, height: 4), radius: CGFloat = 9){
    view.layer.shadowColor = color.cgColor
    view.layer.shadowOpacity = opacity
    view.layer.shadowOffset = offset
    view.layer.shadowRadius = radius
}

