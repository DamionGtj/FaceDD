//
//  WorkBaseVC.swift
//  FaceDD
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 FaceChina. All rights reserved.
//
/// -------》工作主页《---------///////

import Foundation
import UIKit

class WorkBaseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    var imgArr = ["notice","DailyRecord","payrollCalculator"]
    var bgColorArr = [HEXCOLOR(0x5f97f6),HEXCOLOR(0x9b89b6),HEXCOLOR(0xf55e5d)]
    var titleList = ["公告","日志","工资"]
    
    
    var cyclePictureView: CyclePictureView!
    var imageLocalArray : [String] = ["CyclePicture_1.jpg","CyclePicture_2.jpg","CyclePicture_3.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "工作"
//        self.title = "工作"
//        self.navigationController?.navigationBar.topItem?.title = "blabla"
        self .configUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     页面UI配置
     */
    func configUI(){
        //设背景色
        self.view.backgroundColor = BG_COLOR
        //轮播图
        let CarouselFigureView = UIView()
        CarouselFigureView.backgroundColor = UIColor.greenColor()
        CarouselFigureView.frame = CGRectMake(0, HeightOfNavigationBar, screenWidth, 125)
        self.view.addSubview(CarouselFigureView)
        
        let cyclePictureView = CyclePictureView(frame: CGRectMake(0, HeightOfNavigationBar, screenWidth, 125), imageURLArray: nil)
        cyclePictureView.backgroundColor = UIColor.redColor()
        cyclePictureView.localImageArray = imageLocalArray
        cyclePictureView.timeInterval = 3
        self.view.addSubview(cyclePictureView)
        
        //公告、日志、工资等按钮
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        layout.itemSize = CGSizeMake(screenWidth/3, screenWidth/3)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView:UICollectionView = UICollectionView(frame:CGRectMake(0, HeightOfNavigationBar+125, screenWidth, screenWidth/3),collectionViewLayout:layout )
        collectionView.backgroundColor = BG_COLOR
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView .registerClass(WorkBaseCollectionCell.self, forCellWithReuseIdentifier:"cell")
        self.view.addSubview(collectionView)
        
    }
    
    //设置分区个数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    //设置每个分区元素个数
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  imgArr.count
    }
    
    //设置元素内容
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! WorkBaseCollectionCell

        cell.layer.borderWidth = 0.25;
        cell.layer.borderColor = LINE_COLOR.CGColor
        cell.imgView?.image = UIImage(named: imgArr[indexPath.row])
        cell.imgBackView?.backgroundColor = bgColorArr[indexPath.row]
        cell.titleLabel!.text = titleList[indexPath.row]
        return cell
    }
    
    //点击元素
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        print("点击了第\(indexPath.section) 分区 ,第\(indexPath.row) 个元素")
        switch indexPath.row {
        case 0:
            print("去公告页面")
            self.goWorkNotice()
            break
        case 1:
            print("去日志页面")
            self.goWorkLog()
            break
        case 2:
            print("去工资页面")
            self.goPayrollCalculator()
            break
        default:
            break
        }
    }
    //页面跳转
    //日志
    func goWorkLog(){
        let vc = WorkLogVC()
//        self.navigationController!.presentViewController(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
//        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    //公告
    func goWorkNotice(){
        let vc = WorkNoticeVC()
        self.navigationController?.pushViewController(vc, animated: true)
//        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    //工资计算器
    func goPayrollCalculator() {
        let vc = PayrollCalculatorVC()
        self.navigationController?.pushViewController(vc, animated: true)
        //        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
}
