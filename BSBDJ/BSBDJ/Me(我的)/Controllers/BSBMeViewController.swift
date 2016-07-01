//
//  BSBMeViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBMeViewController: UITableViewController {

   
    var  footerview = BSBMeFooterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavgationbar()
        setUpMainInterface()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BSBMeViewController.relayouts), name: "initsuccess", object: nil)
        self.view.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.8)
        // Do any additional setup after loading the view.
    }

    
    func relayouts() {
        
        
         self.tableView.tableFooterView = footerview
//        self.view.layoutIfNeeded()/
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
        
        self.tableView.style
        self.tableView.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.8)
//
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
//        self.tableView.setValue(UITableViewStyle.Grouped, forKeyPath: "style")
//
        self.tableView.registerClass(BSBMeCell.classForCoder(), forCellReuseIdentifier: "me")
//        // 调整header和footer
        self.tableView.sectionHeaderHeight = 0;
        self.tableView.sectionFooterHeight = 10;
        
//
//        // 调整inset
        self.tableView.contentInset = UIEdgeInsetsMake(10 - 35, 0, 0, 0);

        self.tableView.showsVerticalScrollIndicator = false
        
        let footerviwe = BSBMeFooterView()
        footerview = footerviwe
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let  cell : BSBMeCell  = tableView.dequeueReusableCellWithIdentifier("me") as! BSBMeCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        if (indexPath.section == 0) {
            cell.imageView!.image = UIImage(named: "setup-head-default")
            cell.textLabel!.text = "登录/注册";
        } else if (indexPath.section == 1) {
            cell.textLabel!.text = "离线下载";
        }
        return cell;
        
    }
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
