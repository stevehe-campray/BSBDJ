//
//  BSBSubscribeController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/18.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBSubscribeController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var subscribetableview: UITableView!
    private var tagarray : [BSBTagInfo] = []
    var manager : AFHTTPSessionManager = AFHTTPSessionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainInterface()
        loadsubscribeData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     tableview代理方法
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = BSBEssenceSubTagCell.cellWithTableView(tableView)
        cell.taginfo = tagarray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagarray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 56.0
    }
    
    
    func setUpMainInterface(){
        /**
        注册cell
        */
        self.subscribetableview.registerNib(UINib(nibName: "BSBEssenceSubTagCell", bundle: nil), forCellReuseIdentifier: "tagsId")
        self.subscribetableview.backgroundColor = UIColor.clearColor()
        self.subscribetableview.showsVerticalScrollIndicator = false
        self.view.backgroundColor = UIColor(red: 229/255.0, green: 229/255.0, blue: 229/255.0, alpha: 1)
        self.navigationItem.title = "推荐标签"
    }
    
    
    /**
     数据加载
     */
    func loadsubscribeData(){
        
        self.manager.requestSerializer.timeoutInterval = 20.0
        let parameters : NSMutableDictionary = NSMutableDictionary()
        parameters.setValue("tag_recommend", forKey: "a")
        parameters.setValue("topic", forKey: "c")
        parameters.setValue("sub", forKey: "action")
        
        
   
        
        self.manager.GET(XMGMainURL, parameters: parameters, success: { (_, JSON) -> Void in
            
            let models:[BSBTagInfo] = BSBTagInfo.dict2Model(JSON as! [[String:AnyObject]])
            self.tagarray = models
            self.subscribetableview.reloadData()
            }) { (_, error) -> Void in
                print(error)
        }
        
        
    }
    
}
