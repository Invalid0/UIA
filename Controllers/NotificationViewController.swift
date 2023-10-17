//
//  NotificationViewController.swift
//  uia
//
//  Created by EMPULSE on 04/10/23.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var notificationContainer: UIView!
    @IBOutlet weak var badgeIconContainer: UIView!
    @IBOutlet weak var lockScreenContainer: UIView!
    @IBOutlet weak var notficationSwitch: UISwitch!
    @IBOutlet weak var badgeIconSwitch: UISwitch!
    @IBOutlet weak var lockScreenSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    func setUI(){
        notificationContainer.roundRadius(radiusValue: 10.0, borderWidth: 2.3, borderColor: UIColor(named: "Color_Scan_Button")!)
        badgeIconContainer.roundRadius(radiusValue: 10.0, borderWidth: 2.3, borderColor: UIColor(named: "Color_Scan_Button")!)
        lockScreenContainer.roundRadius(radiusValue: 10.0, borderWidth: 2.3, borderColor: UIColor(named: "Color_Scan_Button")!)
    }
    @IBAction func allowNotificationBtnClicked(_ sender: UIButton){
        
        notficationSwitch.setOn(!notficationSwitch.isOn, animated: true)
    }
    @IBAction func badgeAppIconBtnClicked(_ sender: UIButton){
        badgeIconSwitch.setOn(!badgeIconSwitch.isOn, animated: true)
    }
    @IBAction func showOnLockScreenBtnClicked(_ sender: UIButton){
        lockScreenSwitch.setOn(!lockScreenSwitch.isOn, animated: true)
    }
}
