//
//  Product_RootViewController.swift
//  HelloSwift
//
//  Created by Joe on 16/2/29.
//  Copyright © 2016年 Joe. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct Music {
    let name :String
    let singer :String
    
    init(name:String,singer:String) {
        self.name = name
        self.singer = singer
    }
}

struct MusicListViewModel {
    let data = [Music(name: "《喜欢你》", singer: "邓紫棋"),
                Music(name: "《咖啡》", singer: "张学友"),
                Music(name: "《龙卷风》", singer: "周杰伦"),
                Music(name: "《天黑黑》", singer: "孙燕姿")]
    
}

let musicListViewModel = MusicListViewModel()
class Product_RootViewController : JWBaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "产品列表"
        setLeftNaviItemWithTitle("refresh", imageName: "")
        setRightNaviItemWithTitle("endRefresh", imageName: "")
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
        tableView.rowHeight = 42.0
        
    }
    
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return musicListViewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell")!
        let music = musicListViewModel.data[indexPath.row]
        cell.textLabel?.text = music.name
        cell.detailTextLabel?.text = music.singer
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
    }
}
