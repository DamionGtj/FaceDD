//
//  AppDelegate.swift
//  FaceDD
//
//  Created by apple on 16/6/30.
//  Copyright © 2016年 FaceChina. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
//    var rootViewController: UIViewController!
//    var navigationController: DDNavigationController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//         Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        let dangVC = DangBaseViewController()
        let nav1 = UINavigationController(rootViewController:dangVC)
        let image1 = UIImage(named: "dang_unselect")
        nav1.tabBarItem = UITabBarItem(title: "Dang",image:image1,tag:1)
        
        let workVC = WorkBaseViewController()
        let nav2 = UINavigationController(rootViewController:workVC)
        let image2 = UIImage(named: "work_unselect")
        nav2.tabBarItem = UITabBarItem(title: "工作",image:image2,tag:2)
        
        let mineVC = PersonViewController()
        let nav3 = UINavigationController(rootViewController:mineVC)
        let image3 = UIImage(named: "mine_unselect")
        nav3.tabBarItem = UITabBarItem(title: "我",image:image3,tag:3)
        
        let navArr = [nav1,nav2,nav3]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = navArr
        self.window!.rootViewController = tabBarController;
        
        
        
        window!.makeKeyAndVisible()
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        rootViewController = storyboard.instantiateViewControllerWithIdentifier("tabBarController")
//        
//        navigationController = DDNavigationController(rootViewController: rootViewController)
//        
//        window!.rootViewController = rootViewController
//        window!.addSubview(navigationController.view)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

