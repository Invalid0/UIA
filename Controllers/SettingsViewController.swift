//
//  SettingsViewController.swift
//  uia
//
//  Created by EMPULSE on 25/09/23.
//

import UIKit

class SettingsViewController: UIViewController {
    let logoutTitle = "Logout"
    override func viewDidLoad() {
        super.viewDidLoad()

        print("insetting VC")
    }
    @IBAction func myProfileOnClick(_ sender: UIButton){
        print("is Button Clicked")
        navigationController?.pushViewController(myProfileVC, animated: true)
    }
    @IBAction func notificationOnClick(_ sender: UIButton){
        print("notification Cliked")
        navigationController?.pushViewController(notificationVC, animated: true)
    }
    @IBAction func logoutOnClick(_ sender: UIButton){
        let l = logoutTitle.alertMsg(msg: "Are you sure you want to log out?", btnTitle: "Logout?") { logoutBtnCallBack in
            if let tabBarController = self.tabBarController {
                    tabBarController.selectedIndex = 0
                appDelegate.window?.rootViewController = navLoginNavigation
                }
        } cancelAction: { cancleBtnCallBack in
            print("cancle Btn is clicked")
        }
        present(l, animated: true)
    }
}
