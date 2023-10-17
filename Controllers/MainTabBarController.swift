//
//  MainTabBarController.swift
//  uia
//
//  Created by EMPULSE on 25/09/23.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 0
        delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController.isKind(of: UINavigationController.self){
            (viewController as? UINavigationController)?.popToRootViewController(animated: false)
        }
    }
}
