//
//  WorkBaseCollectionCell.swift
//  FaceDD
//
//  Created by 王文俊 on 16/7/15.
//  Copyright © 2016年 FaceChina. All rights reserved.
//
////   工作页collectionViewCell  ///////

import UIKit

class WorkBaseCollectionCell: UICollectionViewCell {
    var imgBackView : UIView?
    var imgView : UIImageView?
    var titleLabel : UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = HEXCOLOR(0xFFFFFF)
        //初始化控件
        imgBackView = UIImageView(frame:CGRectMake((frame.size.width - 35)/2, 22, 35, 35))
        imgBackView?.layer.masksToBounds = true
        imgBackView?.layer.cornerRadius = 5
        self.addSubview(imgBackView!)
        
        imgView = UIImageView(frame:CGRectMake(15/2, 15/2, 20, 20))
        imgBackView!.addSubview(imgView!)
        
        titleLabel = UILabel(frame:CGRectMake((frame.size.width - 35)/2, 22+35+10, 35, 16))
        titleLabel?.font = UIFont.systemFontOfSize(14)
        titleLabel?.textColor = HEXCOLOR(0x333333)
        self.addSubview(titleLabel!)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
