//
//  AppDelegate.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/14.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,UITabBarControllerDelegate{

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        let rootvc = BSBRootViewController()
        rootvc.delegate = self
        window?.rootViewController = rootvc
        window?.makeKeyAndVisible()
        
        let key = "CFBundleShortVersionString"
        let currentversion = NSBundle.mainBundle().infoDictionary?[key] as!NSString
        var sandboxversion = NSUserDefaults.standardUserDefaults().stringForKey(key)
        
        
        if sandboxversion == nil {
            NSUserDefaults.standardUserDefaults().setObject("", forKey: key)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        sandboxversion = NSUserDefaults.standardUserDefaults().stringForKey(key);
        print(!currentversion .isEqualToString(sandboxversion!))
        if (!currentversion .isEqualToString(sandboxversion!)) {
            let gudieview = BSBGudieView.gudieview()
            gudieview.frame = (window?.bounds)!
            self.window?.addSubview(gudieview);
            NSUserDefaults.standardUserDefaults().setObject(currentversion, forKey: key)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        // Override point for customization after application launch.
        return true
    }
    
    
    //点击2次
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        NSNotificationCenter.defaultCenter().postNotificationName("tabarselect", object: nil, userInfo: nil)
        
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

