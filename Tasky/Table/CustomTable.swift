//
//  CustomTable.swift
//  Tasky
//
//  Created by Fikri Muhammad Nur on 12/08/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit


class CustomTable : UITableView{
    var modelData : [DataModel]!
    var controller : UIViewController!
}

extension CustomTable : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableCell
        customCell.mTitle = modelData[indexPath.row]
        
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
    }
}
