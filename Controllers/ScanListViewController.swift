//
//  ScanListViewController.swift
//  uia
//
//  Created by EMPULSE on 09/10/23.
//

import UIKit

class ScanListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let qrListData = MyProfileStaticData.myProfileStaticDataRef.qrScanListData()
    var data: [String: Any]!
    var cellHeight = [Int: CGFloat]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        registerCell()
        tableView.reloadData()
//        print("Data = \(data)")
        print("Data = \(MyProfileStaticData.myProfileStaticDataRef.getListDetails(indx: 5))")
    }
    
    
    func registerCell(){
        tableView.register(scanListTableCell, forCellReuseIdentifier: "idScanListTableViewCell")
        tableView.register(reportTableCell, forCellReuseIdentifier: "idReportTVC")
        tableView.register(rejectButtonTVC, forCellReuseIdentifier: "idRejectButtonTVC")
    }

}
extension ScanListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qrListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let type = qrListData[index]["type"] as? String
        switch (type) {
        case "label":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idScanListTableViewCell", for: indexPath) as! ScanListTableViewCell
            cell.setUI(data: qrListData[index])
            return cell
        case "report":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idReportTVC", for: indexPath) as! ReportTVC
            cellHeight[index] = 142
            return cell
        case "button":
            let cell = tableView.dequeueReusableCell(withIdentifier: "idRejectButtonTVC", for: indexPath) as! RejectButtonTVC
            cell.setUI(data: qrListData[index])
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight[indexPath.row] ?? 44.0
    }
}
