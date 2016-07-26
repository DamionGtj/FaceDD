//
//  PayrollCalculatorTableViewCell.swift
//  FaceDD
//
//  Created by 王文俊 on 16/7/20.
//  Copyright © 2016年 FaceChina. All rights reserved.
//

import UIKit

class PayrollCalculatorTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()//标题
    let inputTextField = UITextField()//输入项
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configUI(){
        self.addSubview(titleLabel)
        titleLabel.textColor = HEXCOLOR(0x333333)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.centerY.equalTo(self.snp.centerY)
        }
   
        self.addSubview(inputTextField)
        inputTextField.textColor = HEXCOLOR(0x666666)
        inputTextField.textAlignment = .Right
        inputTextField.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-15)
            make.left.equalTo(titleLabel.snp.right)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        let line = UILabel()
        line.backgroundColor = BG_COLOR
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.bottom.right.equalTo(self)
            make.left.equalTo(self).offset(15)
            make.height.equalTo(0.5)
        }
    
    }
    
    func initWithRow(row:Int, title: String, textField: String){
        if(row == 0){
            inputTextField.placeholder = "请输入工资金额"
        }
        else if(row == 1){
            inputTextField.placeholder = "请输入岗位绩效"
        }
        else{
            inputTextField.placeholder = textField
        }
        titleLabel.text = title
        
    }

}
