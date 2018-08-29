//
//  MyWealth_RootViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//
 
import UIKit

class MyWealth_RootViewController : JWBaseViewController, UITableViewDataSource, UITableViewDelegate  {
   
    override func viewDidLoad() {
        
        self.navigationItem.title = "我的账户"
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let rootTabBarController = tabBarController as! RootTabBarController
        
        rootTabBarController.showLoginModule(animated: true) { (loginType, finished) -> Void in
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let identifier = "UITableViewCell"
        
        var cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        
        cell = tableView .dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        
        
        return cell;
    }
    
}
