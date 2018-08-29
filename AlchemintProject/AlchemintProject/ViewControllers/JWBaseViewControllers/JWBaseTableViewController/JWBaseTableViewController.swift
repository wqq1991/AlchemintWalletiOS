//
//  JWBaseTableViewController.swift
//  HelloSwift
//
//  Created by WuQiaoqiao on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit


class JWBaseTableViewController: JWBaseViewController , UITableViewDelegate ,UITableViewDataSource {
    
    /// tableView实例
    var tableView = UITableView()
    
    /// 分割线偏移量
    var tableViewLayoutMargins = UIEdgeInsetsMake(15, 0, 0, 0)
    
    /// 分割线偏移量
    var tableViewSeparatorInset = UIEdgeInsetsMake(15, 0, 0, 0)
    
    /// 下拉刷新控件实例(私有)
//    fileprivate var refreshView = SSColorfulRefresh()
    
    override func viewDidLoad() {
        
        
        
    }
    
    /**
     创建一个Tableview
     
     - parameter style:       style
     - parameter aEdgeInsets: edgeInsets
     */
    func createTableViewWithStyle(_ style: UITableViewStyle, edgeInsets aEdgeInsets: UIEdgeInsets) {
    
        let mTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), style: style)
        
        mTableView.tableFooterView = UIView()
        mTableView.dataSource = self
        mTableView.delegate = self
        mTableView.rowHeight = 50
        mTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mTableView)
        
//        let views = ["mTableView": mTableView]
//        
//        let visualFormatH = "H:|-" + String(describing: aEdgeInsets.left) + "-[mTableView]-" + String(describing: aEdgeInsets.right) + "-|"
//
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormatH, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
//
//        let visualFormatV = "V:|-" + String(describing: aEdgeInsets.top) + "-[mTableView]-" + String(describing: aEdgeInsets.bottom) + "-|"
//
//         view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormatV, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
//        
//        tableView = mTableView
    }
    
    /**
     添加下拉刷新控件
     */
    func addRefreshControl() {
    
//        let colorRefresh = SSColorfulRefresh(scrollView: tableView, colors: nil)
//        colorRefresh?.addTarget(self, action: #selector(JWBaseTableViewController.refreshAction(_:)), for: .valueChanged)
//
//        refreshView = colorRefresh!
    }
    
    /**
     下拉刷新事件
     
     - parameter refresh: refresh description
     */
//    func refreshAction(_ refresh: SSColorfulRefresh) {
//    
//        dispatch_after_delay(2.0) {
//            
//            self.endRefreshing()
//        }
//        
//    }
    
    /**
     开始刷新
     */
    func beginRefresh() {
    
//        refreshView.beginRefreshing()
    }
    
    /**
     结束刷新
     */
    func endRefreshing() {
    
//        refreshView.endRefreshing()
    }
    
    /**
     更新Tableview 数据 并 结束刷新
     */
    func tableViewReloadData() {
    
        tableView.reloadData()
        endRefreshing()
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
    
    
    override func viewDidLayoutSubviews() {
        
        if tableView.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
        
            tableView.separatorInset = tableViewSeparatorInset
        }
        
        if tableView.responds(to: #selector(setter: UIView.layoutMargins)) {
            
            tableView.layoutMargins = tableViewLayoutMargins
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            
            cell.separatorInset = tableViewSeparatorInset
        }
        
        if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
        
            cell.layoutMargins = tableViewLayoutMargins
        }
        
    }
    
}
