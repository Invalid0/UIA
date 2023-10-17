//
//  MyProfileStaticData.swift
//  uia
//
//  Created by EMPULSE on 22/09/23.
//

import Foundation

class MyProfileStaticData{
    static let myProfileStaticDataRef = MyProfileStaticData()
    
    func getProfileStaticData() -> [[String: Any]]{
        var temp = [[String: Any]]()
        temp.append(["type":"profileView"])
        temp.append(["type":"textField","placeHolder":"Name", "labelValue":"Name*"])
        temp.append(["type":"textField","placeHolder":"Phone No", "labelValue":"Phone No*"])
        temp.append(["type":"textField","placeHolder":"Email Id", "labelValue":"Email Id*"])
        temp.append(["type":"textField","placeHolder":"Company Name", "labelValue":"Company Name"])
        temp.append(["type":"passwordTextField","placeHolder":"Password", "labelValue":"Password*"])
        temp.append(["type":"dropDown","placeHolder":"City", "labelValue":"City"])
        temp.append(["type":"dropDown","placeHolder":"State", "labelValue":"State"])
        temp.append(["type":"dropDown","placeHolder":"Country", "labelValue":"Country"])
        temp.append(["type":"textField","placeHolder":"Zip Code", "labelValue":"Zip Code"])
        temp.append(["type":"textView","placeHolder":"Address", "labelValue":"Addres"])
        temp.append(["type":"button","labelValue":["Update":"Cancle"]])
        return temp
    }
    
    func qrScanListData() -> [[String: Any]]{
        var temp = [[String: Any]]()
        temp.append(["type":"label","Key":"categorie","value":"Tanker"])
        temp.append(["type":"label","Key":"Sub categorie","value":"3000 Gallon Super Tanker"])
        temp.append(["type":"label","Key":"Template","value":"Stock 3000 Gallon Super Tanker"])
        temp.append(["type":"label","Key":"Assigned By","value":"Jhol Beal"])
        temp.append(["type":"label","Key":"Inspection Due Date","value":"28/Aug/2023"])
        temp.append(["type":"label","Key":"Overdue","value":"2"])
        temp.append(["type":"label","Key":"Status","value":"Save"])
        //        temp.append(["type":"start","value":"Start"])
        //        temp.append(["type":"report"])
        //        temp.append(["type":"button","value":"Start Inspection" ])
        temp.append(["type":"button","value":"Inspect"])
        return temp
    }
    
    
    /*
     ["type": "Re-Inspect", "truckDetails": [["modelNumber": "SO-4562"], ["text": "CashRule"], ["date": "21/Jun/2023"]]]
     
     ["type":"label","Key":"categorie","value":"Tanker"]
     */
    
    
    func qrScanListData(data: [String: Any]) -> [String: Any]{
        var temp = [String: Any]()
        for (key, value) in data{
            temp[key] = value
        }
        return temp
    }
    
    func getListDetails(indx: Int) -> [String: Any]? {
        var temp = [[String: Any]]()
        
        for index in 0..<10 {
            let truckDetail = [
                "id": index,
                "truckDetails": [
                    ["type": "label", "Key": "categorie", "value": "Tanker"],
                    ["type": "label", "Key": "Sub categorie", "value": "3000 Gallon Super Tanker"],
                    ["type": "label", "Key": "Template", "value": "Stock 3000 Gallon Super Tanker"]
                ]
            ] as [String: Any]
            temp.append(truckDetail)
        }
        
        if indx >= 0, indx < temp.count {
            return temp[indx]
        } else {
            return nil
        }
    }

  

    func inspectListData() -> [[String: Any]]{
        //        ["All","Save","Released","Re-Inspect" ,"Rejected"]
        var temp = [[String: Any]]()
        temp.append(["truckDetails":[["modelNumber":"SO-4564"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Relesed"])
        temp.append(["truckDetails":[["modelNumber":"SO-4563"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Rejected"])
        temp.append(["truckDetails":[["modelNumber":"SO-4562"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Re-Inspect"])
        temp.append(["truckDetails":[["modelNumber":"SO-4561"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Save"])
        temp.append(["truckDetails":[["modelNumber":"SO-4563"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Rejected"])
        temp.append(["truckDetails":[["modelNumber":"SO-4564"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Relesed"])
        temp.append(["truckDetails":[["modelNumber":"SO-4563"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Rejected"])
        temp.append(["truckDetails":[["modelNumber":"SO-4562"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Re-Inspect"])
        temp.append(["truckDetails":[["modelNumber":"SO-4561"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Save"])
        temp.append(["truckDetails":[["modelNumber":"SO-4563"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Rejected"])
        temp.append(["truckDetails":[["modelNumber":"SO-4564"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Relesed"])
        temp.append(["truckDetails":[["modelNumber":"SO-4563"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Rejected"])
        temp.append(["truckDetails":[["modelNumber":"SO-4562"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Re-Inspect"])
        temp.append(["truckDetails":[["modelNumber":"SO-4561"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Save"])
        temp.append(["truckDetails":[["modelNumber":"SO-4563"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Rejected"])
        temp.append(["truckDetails":[["modelNumber":"SO-4564"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Relesed"])
        temp.append(["truckDetails":[["modelNumber":"SO-4563"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Rejected"])
        temp.append(["truckDetails":[["modelNumber":"SO-4562"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Re-Inspect"])
        temp.append(["truckDetails":[["modelNumber":"SO-4561"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Save"])
        temp.append(["truckDetails":[["modelNumber":"SO-4563"],["text":"CashRule"],["date":"21/Jun/2023"]],"type":"Rejected"])
        
        return temp
    }
}

