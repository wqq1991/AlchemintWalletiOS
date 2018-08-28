//
//  ViewController.swift
//  AlchemintProject
//
//  Created by WuQiaoqiao on 2018/8/17.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import UIKit
import Neoutils
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var wifTf: UITextField!
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        
        loginBtnAction()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let url = "http://192.168.0.101:59908/api/privatenet?method=getutxo&params=['AQdP56hHfo54JCWfpPw4MXviJDtQJMtXFa']";
        
        asyncGetResquest(api: API, method: "getutxo", params: "[\"AQdP56hHfo54JCWfpPw4MXviJDtQJMtXFa\"]", fail: { (error) in
            
            DLog("error = \(error)")
        }) { (jsonValue) in
            
            DLog("jsonValue = \(jsonValue)")
        }
        
//        Alamofire.request(url).responseJSON { (response) in
//
//            if let Error = response.result.error
//            {
//                DLog("Error = \(Error)");
//
//            }else if let jsonValue = response.result.value
//            {
//                DLog("jsonValue = \(jsonValue)")
//            }
//        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginBtnAction() {
        
        
        
    }
    

}

