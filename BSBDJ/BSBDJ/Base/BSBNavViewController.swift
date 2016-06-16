//
//  BSBNavViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override class func initialize(){
        
        let bg:UIImage = UIImage(named:"navigationbarBackgroundWhite")!
        let bar:UINavigationBar = UINavigationBar.appearance()
        bar.setBackgroundImage(bg, forBarMetrics: UIBarMetrics.Default)
        bar.titleTextAttributes=[NSFontAttributeName:UIFont.systemFontOfSize(18)]
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            let button = UIButton(type: UIButtonType.Custom)
            button.setTitle("返回", forState: UIControlState.Normal)
            button.setImage(UIImage(named:"navigationButtonReturn"), forState: UIControlState.Normal)
            button.setImage(UIImage(named:"navigationButtonReturnClick"), forState: UIControlState.Highlighted)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
            
            button.addTarget(self, action: #selector(BSBNavViewController.back), forControlEvents: UIControlEvents.TouchUpInside)
            
            button.bounds = CGRectMake(0, 0, 70, 30)
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0)
            button.titleLabel?.font = UIFont.systemFontOfSize(16)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
        super.pushViewController(viewController, animated:animated)
    }
   

    
    func back(){
        self.popViewControllerAnimated(true)
    }

}
