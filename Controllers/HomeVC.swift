//
//  HomeVC.swift
//  uia
//
//  Created by EMPULSE on 19/09/23.
//
//hiii he


import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var scanContainer: UIView!
    @IBOutlet weak var inspectionContainer: UIView!
    @IBOutlet weak var filterContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFilterDropDown: DropDown!
    @IBOutlet weak var scanBtn: UIButton!
    @IBOutlet weak var inspectionBtn: UIButton!
    @IBOutlet weak var topNavigationBar: TopNavigationBar!
    var isClickedFilter = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        registerCell()
        textFilterDropDown.optionArray = ["All","Released","Saved","Rejected"]
    }
    func setUI(){
        scanContainer.roundRadius(radiusValue: scanContainer.bounds.width / 2, borderWidth: 1,borderColor: UIColor(named: "LoginButton")!)
        inspectionContainer.roundRadius(radiusValue: scanContainer.bounds.width / 2, borderWidth: 1,borderColor: UIColor(named: "LoginButton")!)
        scanBtn.setTitle("", for: .normal)
        inspectionBtn.setTitle("", for: .normal)
    }
    func registerCell(){
        tableView.register(filterListTableCell, forCellReuseIdentifier: "idFilterListTableViewCell")
    }
    
    @IBAction func qrScanBtnClicked(_ sender: UIButton){
        guard let qrTabBarController = tabBarController else{
            return
        }
        qrTabBarController.selectedIndex = 1
    }
    
    @IBAction func inspectionBtnClicked(_ sender: UIButton){
        guard let inspectionTabBarController = tabBarController else{
            return
        }
        inspectionTabBarController.selectedIndex = 2
    }
    @IBAction func filterBtnClicked(_ sender: UIButton){
        
    }
    func presentFilterList<T: UIView, U: UIView>(_ sender: T, _ objectRef: U){
        print("add")
        objectRef.frame = CGRect(x: sender.frame.minX + 3, y: filterContainer.frame.maxY + 100, width: sender.frame.width, height: 100)
        self.view.addSubview(objectRef)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idFilterListTableViewCell", for: indexPath) as! FilterListTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
