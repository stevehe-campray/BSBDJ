//
//  BSBNewViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBNewViewController: BSBEssenceViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         setUpNavgationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
    override func setUpNavgationBar(){
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        let leftbutton = UIButton()
        leftbutton.setBackgroundImage(UIImage(named: "MainTagSubIcon"), forState: UIControlState.Normal)
        leftbutton.setBackgroundImage(UIImage(named: "MainTagSubIconClick"), forState: UIControlState.Highlighted)
        let width = leftbutton.currentBackgroundImage?.size.width
        let height = leftbutton.currentBackgroundImage?.size.height
        leftbutton.bounds = CGRect(x: 0, y: 0, width:width!, height:height!)
        leftbutton.addTarget(self, action: "menuclick", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbutton)
    }
    
   override func menuclick(){
        print("23323131231")
    }

}
