//
//  PayrollCalculatorVC.swift
//  FaceDD
//
//  Created by 王文俊 on 16/7/14.
//  Copyright © 2016年 FaceChina. All rights reserved.
//
/// ---》工作---》工资计算器////////////

import Foundation
import UIKit
import SnapKit

class PayrollCalculatorVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate

{
    var titleList = ["工资基数","岗位绩效","加班次数","事假天数","病假天数","迟到次数"]
    let headerView = UIView()
    
    let finalWagesLabel:UILabel = UILabel()//工资
    
    private var wages = 0.0
    private var performance = 0.0
    private var overtime = 0.0
    private var casualLeave = 0.0
    private var sickLeave = 0.0
    private var late = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "工资计算器";
        self.tabBarController?.tabBar.hidden = true
        self.view.backgroundColor = UIColor.whiteColor()
        configUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func creatHeaderView(){
        headerView.frame = CGRectMake(0,0,screenWidth,112)
        headerView.backgroundColor = HEXCOLOR(0xD96E5d)
        //分割线
        let line = UILabel()
        line.backgroundColor = LINE_COLOR
        headerView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.centerX.equalTo(headerView.snp.centerX)
            make.centerY.equalTo(headerView.snp.centerY)
            make.height.equalTo(63)
            make.width.equalTo(1)
        }
        
        //工资view
        let wagesView = UIView()
        headerView.addSubview(wagesView)
        wagesView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(headerView)
            make.right.equalTo(line.snp.left)
        }
        
        let wagesTtileLabel = UILabel()
        wagesTtileLabel.font = UIFont.systemFontOfSize(14)
        wagesTtileLabel.text = "工资（元）"
        wagesTtileLabel.textColor = UIColor.whiteColor()
        wagesView.addSubview(wagesTtileLabel)
        wagesTtileLabel.snp.makeConstraints { (make) in
            make.left.equalTo(wagesView).offset(15)
            make.top.equalTo(wagesView).offset(25)
        }
        
        finalWagesLabel.font = UIFont.systemFontOfSize(23)
        finalWagesLabel.text = "--"
        finalWagesLabel.textColor = UIColor.whiteColor()
        wagesView.addSubview(finalWagesLabel)
        finalWagesLabel.snp.makeConstraints{ (make) in
            make.left.equalTo(wagesView).offset(15)
            make.top.equalTo(wagesTtileLabel.snp.bottom).offset(28)
        }
        //五险一金View
        let socialSecurityView = UIView()
        headerView.addSubview(socialSecurityView)
        socialSecurityView.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(headerView)
            make.left.equalTo(line.snp.right)
        }
        
        let socialSecurityTtileLabel = UILabel()
        socialSecurityTtileLabel.font = UIFont.systemFontOfSize(14)
        socialSecurityTtileLabel.text = "五险一金（元）"
        socialSecurityTtileLabel.textColor = UIColor.whiteColor()
        socialSecurityView.addSubview(socialSecurityTtileLabel)
        socialSecurityTtileLabel.snp.makeConstraints { (make) in
            make.left.equalTo(socialSecurityView).offset(15)
            make.top.equalTo(socialSecurityView).offset(25)
        }
        
        let socialSecurityLabel = UILabel()
        socialSecurityLabel.font = UIFont.systemFontOfSize(23)
        socialSecurityLabel.text = "258元"
        socialSecurityLabel.textColor = UIColor.whiteColor()
        socialSecurityView.addSubview(socialSecurityLabel)
        socialSecurityLabel.snp.makeConstraints { (make) in
            make.left.equalTo(socialSecurityView).offset(15)
            make.top.equalTo(socialSecurityTtileLabel.snp.bottom).offset(28)
        }
        
        
    }
    
    func configUI(){
        creatHeaderView()
        
        //tableView
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(PayrollCalculatorTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view)
            make.left.right.bottom.equalTo(self.view)
        }
        tableView.tableHeaderView = headerView
    }
 
    /**
     出勤率
     
     - parameter casualLeave: 事假天数
     - parameter sickLeave:   病假天数
     
     - returns: 返回出勤率
     */
    func attendance(casualLeave:Double,sickLeave:Double) -> Double {
        return (21.75 - casualLeave - sickLeave*0.5)/21.75
    }
    
    /*
     //加班绩效
     //10次以上1.5//5次以上1.25//0-5次1.1
     **参数 加班次数
     **返回值 加班绩效
     */
    func overtimePerformance(overtime:Double) -> Double {
        if overtime > 10 {
            return 1.5
        }
        else if overtime > 5 {
            return 1.25
        }
        else if overtime > 0{
            return 1.1
        }
        else{
            return 1.0
        }
    }
    
    //UITableViewDataSource,UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    //每个cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    //绘制cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let initIdentifier = "Cell"

        var cell = tableView.dequeueReusableCellWithIdentifier(initIdentifier,forIndexPath : indexPath) as? PayrollCalculatorTableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: initIdentifier) as? PayrollCalculatorTableViewCell
        }
        let title = titleList[indexPath.row]
        cell?.initWithRow(indexPath.row, title:title,textField: "0")

        cell?.inputTextField.tag = indexPath.row
        cell?.inputTextField.delegate = self
        cell?.inputTextField .addTarget(self, action:#selector(PayrollCalculatorVC.calculateWages(_:)), forControlEvents: UIControlEvents.EditingChanged)
        
        return cell!
    }
    
    func calculateWages(textField:UITextField){
        
        print("编辑")
        switch textField.tag {
        case 0:
            if (textField.text?.characters.count == 0){
                wages = 0
            }
            else{
                wages = Double (textField.text!)!
            }
        case 1:
            if (textField.text?.characters.count == 0){
                performance = 1
            }
            else{
                performance = Double (textField.text!)!
            }
        case 2:
            if (textField.text?.characters.count == 0){
                overtime = 0
            }
            else{
                overtime = Double (textField.text!)!
            }
        case 3:
            if (textField.text?.characters.count == 0){
                casualLeave = 0
            }
            else{
                casualLeave = Double (textField.text!)!
            }
        case 4:
            if (textField.text?.characters.count == 0){
                sickLeave = 0
            }
            else{
                sickLeave = Double (textField.text!)!
            }
        case 5:
            if (textField.text?.characters.count == 0){
                late = 0
            }
            else{
                late = Double (textField.text!)!
            }
        default:
            break
        }
        var finalWages = 0.0
        //加班绩效
        let overtimePer = overtimePerformance(overtime)
        //出勤率
        let attendanceRate = attendance(casualLeave,sickLeave:sickLeave)
        
        finalWages = wages*(0.3*(0.4*overtimePer + 0.6*performance)+0.7)*attendanceRate - 258 - late * 50
        finalWagesLabel.text = String(format: "%.2f元", finalWages)

    }


}