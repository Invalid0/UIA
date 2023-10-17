//
//  MyProfileVC.swift
//  uia
//
//  Created by EMPULSE on 21/09/23.
//

import UIKit

class MyProfileVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileEditBtn: UIButton!
    var cellheight = [Int: CGFloat]()
    let profileData = MyProfileStaticData.myProfileStaticDataRef.getProfileStaticData()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerMyProfileXibCells()
    }
    func registerMyProfileXibCells(){
        tableView.register(myProfileTVC, forCellReuseIdentifier: "idMyProfileTVC")
        tableView.register(textFieldTVC, forCellReuseIdentifier: "idTextFieldTVC")
        tableView.register(dropdownTVC, forCellReuseIdentifier: "idDropdownTVC")
        tableView.register(textViewTVC, forCellReuseIdentifier: "idTextViewTVC")
        tableView.register(buttonTVC, forCellReuseIdentifier: "idButtonTVC")
        tableView.register(passwordTextFieldTVC, forCellReuseIdentifier: "idPasswordTextFieldTVC")
    }
    func setUI(){
        profileEditBtn.setTitle("", for: .normal)
    }
}

extension MyProfileVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indx = indexPath.row
        let type = profileData[indexPath.row]["type"] as? String
        switch (type){
        case "profileView":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idMyProfileTVC", for: indexPath) as! MyProfileTVC
            cellheight[indx] = cell.cellHeight
            cell.proflieEditBtn.addTarget(self, action: #selector(editProfileOnClick(_ :)), for: .touchUpInside)
            return cell
        case "textField":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idTextFieldTVC", for: indexPath) as! TextFieldTVC
            cell.setUI(data: profileData[indexPath.row])
            return cell
        case "passwordTextField":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idPasswordTextFieldTVC", for: indexPath) as! PasswordTextFieldTVC
            cell.setUI(data: profileData[indexPath.row])
            return cell
        case "dropDown":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idDropdownTVC", for: indexPath) as! DropdownTVC
            cell.setUI(data: profileData[indexPath.row])
            return cell
        case "textView":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idTextViewTVC", for: indexPath) as! TextViewTVC
            cellheight[indx] = 120
            cell.setUI(data: profileData[indexPath.row])
            return cell
        case "button":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idButtonTVC", for: indexPath) as! ButtonTVC
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  cellheight[indexPath.row] ?? 80.0
    }
    @objc func editProfileOnClick(_ sender: UIButton){
        print("Clickd on Profile Controller")
    }
}
