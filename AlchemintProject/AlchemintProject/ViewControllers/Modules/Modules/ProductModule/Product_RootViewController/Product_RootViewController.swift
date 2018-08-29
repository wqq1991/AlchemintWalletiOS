//
//  Product_RootViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit

class Product_RootViewController : JWBaseViewController {
    /*
    override func viewDidLoad() {
        
        self.navigationItem.title = "产品列表"
//        setLeftNaviItemWithTitle("refresh", imageName: "")
//        setRightNaviItemWithTitle("endRefresh", imageName: "")
        
        createTableViewWithStyle(.plain ,edgeInsets: UIEdgeInsets.zero)
        addRefreshControl()
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    override func leftItemTapped() {
        
        beginRefresh()
    }
    
    override func rightItemTapped() {
        
        endRefreshing()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        return 45
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "UITableViewCellID"
        
        let cell =  ProductListCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        cell.textLabel?.text = "产品名称" + String(indexPath.row + 1)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
        cell.textLabel?.textColor = kThemeColor2
        cell.selectionStyle = .none
        
//        cell.selectedBackgroundView = UIImageView(image: UIImage.imageWithColor(UIColor.colorFromeRGB(0xf0f0f0, A: 0.3)))
        cell.textLabel?.highlightedTextColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.isSelected = false
        
        let productVC = UIStoryboard(name: "ProductModule", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController")
        productVC.hidesBottomBarWhenPushed = true
        self.pushViewController(productVC, animated: true)
    }
    */
}
