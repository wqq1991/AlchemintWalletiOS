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
        
        
        asyncGetResquest(api: BASE_URL, method: "getutxo", params: "['AQdP56hHfo54JCWfpPw4MXviJDtQJMtXFa']", fail: { (error) in
            
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
    
    func Array() {
        
        var array : [String] = ["a","b","c"]
        
        array += ["d","e"]
        
        array.append("f")
        
        array[3...5] = ["1","2","3"]
        
        array.insert("10", at: 7)
        
        for (index, value) in array.enumerated() {
            
            DLog("value = \(value) index = \(index)")
        }
        
        
        
    }
    
    func Dictionary() {
        
        var dictionary = [String: String]()
        
        dictionary = ["11":"a","12":"b","13":"c"];
        
        DLog(dictionary)
        
    }
    
    func NeoSDK() {
        
    
        
    }
    
    enum BeerStyle: String,Codable{
        case ipa
        case stout
        case kolsch
    }
    
    struct Beer: Codable {
        let name: String
        let brewery: String
        let style: BeerStyle
        
    }
    
   public func jsonToObject() {
        
        let jsonString = " { \"name\": \"Endeavor\", \"abv\": 8.9, \"brewery\": \"Saint Arnold\", \"style\": \"ipa\" }"

        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let beer = try! decoder.decode(Beer.self, from: jsonData)
        
        DLog("beer = \(beer)")
    
    }
    
   public func objectToJson() {
    
    let model = Model()
    
    let encoder = JSONEncoder()
    
    let data = try! encoder.encode(model)
    
    DLog(String(data: data, encoding: .utf8)!)
    
    let test = Test()
    
    test.sayHello()
    
    }
}

    class Model: Codable {
        
        let a = "AAA";
        let b = "BBB"
//      let people:People = People()
        
}

class People {
    let age = 15
    let name = "小红"
}

