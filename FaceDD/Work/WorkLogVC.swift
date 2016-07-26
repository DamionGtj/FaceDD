//
//  WorkLogVC.swift
//  FaceDD
//
//  Created by 王文俊 on 16/7/15.
//  Copyright © 2016年 FaceChina. All rights reserved.
//
/// ////---》工作---》工作日志《-------////

import Foundation
import UIKit
import Alamofire

class WorkLogVC: UIViewController {
    
    let BaiduURL = "http://apis.haoservice.com/lifeservice/cook/query?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BG_COLOR
        self.navigationItem.title = "日志"
        self.tabBarController?.tabBar.hidden = true
        self .configUI()
        self .reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configUI() {
        
        let item = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(saveWorkLog))
        self.navigationItem.rightBarButtonItem = item
        
        
        //标题
        let titleBackView = UIView()
        self.view.addSubview(titleBackView)
        titleBackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(64)
            make.left.right.equalTo(self.view)
            make.height.equalTo(55)
        }
        
        let titleTextField = UITextField()
        titleTextField.font = UIFont.systemFontOfSize(24)
        titleTextField.textColor = HEXCOLOR(0xB1B1B1)
        titleTextField.placeholder = "请输入标题"
        titleBackView.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleBackView.snp.centerY)
            make.left.equalTo(titleBackView).offset(15)
            make.right.equalTo(titleBackView).offset(-15)
        }
        
        //分割线
        let line = UILabel()
        line.backgroundColor = LINE_COLOR
        self.view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.equalTo(titleBackView.snp.bottom)
            make.left.equalTo(self.view).offset(15)
            make.right.equalTo(self.view).offset(-15)
            make.height.equalTo(1)
        }
        
        //正文
        let textTextView = UITextView()
        textTextView.font = UIFont.systemFontOfSize(16)
        self.view.addSubview(textTextView)
        textTextView.snp.makeConstraints { (make) in
            make.top.equalTo(line.snp.bottom).offset(15)
            make.left.equalTo(self.view).offset(15)
            make.right.equalTo(self.view).offset(-15)
            make.bottom.equalTo(self.view)
        }
        
    }
    
    
    func saveWorkLog() {
        print("保存日志")
    }
    
    //network请求
    func reloadData(){
        let parameters = [
            "menu": "土豆",
            "pn":  1,
            "rn": "10",
            "key": "2ba215a3f83b4b898d0f6fdca4e16c7c",
            ]
        
        
        Alamofire.request(.POST, BaiduURL, parameters:parameters ).responseJSON {response in
            
            //            debugPrint(response)
            switch response.result {
            case .Success:
                //把得到的JSON数据转为字典
                if let j = response.result.value as? NSDictionary{
                    //获取字典里面的key为数组
                    let Items = j.valueForKey("result")as! NSArray
                    //便利数组得到每一个字典模型
                    for dict in Items{
                        
                        print(dict)
                    }
                    
                }
            case .Failure(let error):
                
                print(error)
            }
            
            
        }
    
    }
}
