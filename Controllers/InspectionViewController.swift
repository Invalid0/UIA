//
//  InspectionViewController.swift
//  uia
//
//  Created by EMPULSE on 25/09/23.
//

import UIKit


class InspectionViewController: UIViewController {
   
    @IBOutlet var tableView: UITableView!
    @IBOutlet var topNavigationBar: TopNavigationBar!
    @IBOutlet var textFilterDropDown: DropDown!
    let qrVC = QrViewController()
    var orginallData = MyProfileStaticData.myProfileStaticDataRef.inspectListData()
    var inspectData = MyProfileStaticData.myProfileStaticDataRef.inspectListData()
    let noDataFound = [["truckDetails":[["modelNumber":"No Data Found"],["text":"No Data Found"],["date":"No Data Found"]],"type":"No Data Found"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
        filterList()
    }
    func filterList() {
        textFilterDropDown.optionArray = ["All","Save","Relesed","Re-Inspect" ,"Rejected"]
        textFilterDropDown.didSelect { selectedText, index, id in
            print("selectedText = \(selectedText), index = \(index), id = \(id)")
            let inspectDataFilter = self.orginallData.filter { dictionary in
                if let type = dictionary["type"] as? String {
                    return type == selectedText
                }
                return false
            }
            self.reloadTable(isData: inspectDataFilter, selectedString: selectedText)
        }
    }
    func reloadTable(isData: [[String: Any]], selectedString: String) {
        inspectData.removeAll()
        !isData.isEmpty ? (inspectData = isData) :  selectedString.contains("All") ? (inspectData = orginallData) : (inspectData = noDataFound)
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isQrScanned{
            self.navigationController?.pushViewController(scanListVC, animated: true)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        isQrScanned = false
    }
    
    func registerCell(){
        tableView.register(inspectionTVC, forCellReuseIdentifier: "idInspectionTVC")
    }
    
}

extension InspectionViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inspectData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let data = inspectData[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "idInspectionTVC", for: indexPath) as! InspectionTVC
        cell.setUI(data: data)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected this cell",indexPath.row)
//        scanListVC.data = inspectData[indexPath.row]
        scanListVC.data = MyProfileStaticData.myProfileStaticDataRef.qrScanListData(data: inspectData[indexPath.row])
        self.navigationController?.pushViewController(scanListVC, animated: true)
        
    }
}

