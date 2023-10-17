//
//  LaunchScreenVC.swift
//  uia
//
//  Created by EMPULSE on 19/09/23.
//

import UIKit

class LaunchScreenController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    func setUI(){
        view.applyLinearGradient(hexColors: linearColorArray)
        callingNextViewController()
        print("In LaunchVC")
    }
    private func callingNextViewController(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
//            let usr = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
            let usr = false
            appDelegate.window?.rootViewController = usr ? tabBarControllers : navLoginNavigation
//            appDelegate.window?.rootViewController = navMyProfileVC
            appDelegate.window?.makeKeyAndVisible()
        }
    }
}
