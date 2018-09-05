//
//  More_RootViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

class More_RootViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var titles = [["关于我们","安全保障","常见问题"],["分享好友","给我们评分","客服咨询","当前版本"]]
    
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "更多信息"
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.rowHeight = 42.0
        mTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MoreListCellID")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 42.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let homePage = UIStoryboard(name: "HomePageModule", bundle: nil).instantiateViewController(withIdentifier: "HomePageModuleNav")
        
        self.navigationController?.pushViewController(homePage, animated: true)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "MoreListCellID"
        
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        
        let titleText =  titles[indexPath.section][indexPath.row]
        cell.textLabel?.text = titleText
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.textColor = kThemeColor2
        
        let imageName = "icon" + String(indexPath.section) + String(indexPath.row)
        
        cell.imageView?.image = UIImage(named: imageName)
        
        if titleText == "当前版本" {
            
            cell.accessoryType = UITableViewCellAccessoryType.none
            cell.detailTextLabel?.text = "版本号(" + String(kVersion) + ")"
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        }else
        {
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
        }
        
        return cell
    }
    
}
