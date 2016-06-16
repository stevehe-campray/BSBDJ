//
//  BSBFriendTrendsViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBFriendTrendsViewController: UIViewController {

    @IBOutlet weak var loginregiterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavgation()
        setupMainInterface()
        self.view.backgroundColor = UIColor.lightGrayColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupMainInterface(){
        loginregiterButton.addTarget(self, action: #selector(BSBFriendTrendsViewController.login), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    @IBAction func LoginButtonPressed(sender: AnyObject) {
        let loginvc = BSBLoginRegisterViewController(nibName:"BSBLoginRegisterViewController", bundle:nil)
        self .presentViewController(loginvc, animated: true, completion: nil)
        
        
    }
    
    func setUpNavgation(){
      self.navigationItem.title = "我的关注"
      let leftButton = UIButton()
      leftButton.setBackgroundImage(UIImage(named: "friendsRecommentIcon"), forState: UIControlState.Normal)
      leftButton.setBackgroundImage(UIImage(named: "cellFollowClickIcon"), forState: UIControlState.Highlighted)
      leftButton.bounds = CGRectMake(0, 0, (leftButton.currentBackgroundImage?.size.width)!, (leftButton.currentBackgroundImage?.size.height)!)
        leftButton.addTarget(self, action: #selector(BSBFriendTrendsViewController.myrecomment), forControlEvents: UIControlEvents.TouchUpInside)
      self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }

    
    func myrecomment(){
        let recomendvc = BSBrecomendViewController(nibName:"BSBrecomendViewController" ,bundle:nil)
        self.navigationController?.pushViewController(recomendvc, animated: true)
    }
    
    
    func login(){
        print("login")
    }

}
