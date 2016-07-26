//
//  WorkNoticeVC.swift
//  FaceDD
//
//  Created by 王文俊 on 16/7/15.
//  Copyright © 2016年 FaceChina. All rights reserved.
//
/// ////---》工作---》公告《-------////

import Foundation
import UIKit

class WorkNoticeVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BG_COLOR
        self.navigationItem.title = "公告"
        self.tabBarController?.tabBar.hidden = true
        self .configUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configUI() {
        let item = UIBarButtonItem(title: "发布", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(pushNotice))
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
    
    func pushNotice() {
        print("发布公告")
    }
}
