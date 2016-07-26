//
//  DangBaseVC.swift
//  FaceDD
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 FaceChina. All rights reserved.
//

import Foundation
import UIKit

class DangBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Dang";
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
