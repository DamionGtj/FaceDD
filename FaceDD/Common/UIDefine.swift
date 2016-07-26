//
//  UIDefine.swift
//  FaceDD
//
//  Created by 王文俊 on 16/7/14.
//  Copyright © 2016年 FaceChina. All rights reserved.
//

import Foundation
import UIKit

//RGB转换
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
}

//16进制转换RGB颜色
func HEXCOLOR(rgbValue: Int) ->UIColor{
    return UIColor(red:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue:((CGFloat)(rgbValue & 0xFF))/255.0, alpha:1.0)
}

//背景色
public let BG_COLOR = HEXCOLOR(0xF8F8F8)
//分割线颜色
public let LINE_COLOR = HEXCOLOR(0xe3e3e3)


//屏幕宽度
public let screenWidth = UIScreen.mainScreen().bounds.size.width
//屏幕高度
public let screenHeight = UIScreen.mainScreen().bounds.size.height
//NavigationController高度
public let HeightOfNavigationBar:CGFloat = 64