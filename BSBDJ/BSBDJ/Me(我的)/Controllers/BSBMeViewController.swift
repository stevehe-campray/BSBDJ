//
//  BSBMeViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBMeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavgationbar()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func  setUpNavgationbar(){
     
        self.navigationItem.title = "我的"
        let settingbutton = UIButton()
        let moonbutton = UIButton()
        settingbutton.setBackgroundImage(UIImage(named: "mine-setting-icon"), forState: UIControlState.Normal)
        settingbutton.setBackgroundImage(UIImage(named: "mine-setting-icon-click"), forState: UIControlState.Highlighted)
        settingbutton.bounds = CGRectMake(0, 0, (settingbutton.currentBackgroundImage?.size.width)!, (settingbutton.currentBackgroundImage?.size.height)!)
        
        moonbutton.setBackgroundImage(UIImage(named: "mine-moon-icon"), forState: UIControlState.Normal)
        moonbutton.setBackgroundImage(UIImage(named: "mine-moon-icon-click"), forState: UIControlState.Highlighted)
        moonbutton.bounds = CGRectMake(0, 0, (moonbutton.currentBackgroundImage?.size.width)!, (moonbutton.currentBackgroundImage?.size.height)!)
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: settingbutton),UIBarButtonItem(customView: moonbutton)]
    }
    
    func setUpMainInterface(){
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
