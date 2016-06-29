//
//  BSBTopicViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/2.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

enum XMGTopicsType: NSInteger {
    case XMGTopicsTypeAll = 1,// 全部
    XMGTopicsTypePicture = 10, // 图片
    XMGTopicsTypeWord = 29, // 段子
    XMGTopicsTypeVoice = 31, // 声音
    XMGTopicsTypeVideo = 41 // 视频
}

class BSBTopicViewController: UITableViewController {
    
    
    //    var datasource : NSMutableArray = NSMutableArray()
    private var datasource : [BSBTopic] = []
    internal var topictype : Int = 1
    internal var type  = XMGTopicsType.XMGTopicsTypeAll
    var nib = UINib()
    
    var page : NSInteger = 0
    var maxtime :NSString = ""
    
    var nibsRegistered : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        nib = UINib(nibName: "BSBTopicCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier:"topics")
        self.tableView.backgroundColor = UIColor.clearColor()
        //        self .loadNewTopic()
        self.setUpRefresh()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpRefresh() {
        
        
      
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(BSBTopicViewController.loadNewTopic))
        self.tableView.mj_header.automaticallyChangeAlpha = true
        self.tableView.mj_header.beginRefreshing()

        
//        self.tableView.registerClass(BSBTopicCell.self, forCellReuseIdentifier:"topicsId")
        self.tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(BSBTopicViewController.loadMoreTopic))
        
        
    }
    
    /**
     下拉刷新
     */
    func loadNewTopic(){
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 20.0
        let parameter = NSMutableDictionary()

        parameter.setValue("list", forKey: "a")
        parameter.setValue("data", forKey: "c")
        parameter.setValue(self.type.rawValue, forKey:"type")
        manager.GET(XMGMainURL, parameters: parameter, success: { (_, jsonrequestobject) -> Void in
            self.page = 0
            self.datasource.removeAll()
            var dic = jsonrequestobject!["info"] as! NSDictionary
            let maxtimes = dic .valueForKey("maxtime") as!NSString
            self.maxtime = maxtimes
            //             = maxtime
            let models:[BSBTopic] = BSBTopic.dict2Model(jsonrequestobject!["list"] as! [[String:AnyObject]])
            for  model in models{
                self.datasource.append(model)
            }
            self.tableView.mj_header.endRefreshing()
            self.tableView.reloadData()
        }) { (_, error)  -> Void in
            self.tableView.mj_header.endRefreshing()
        }
    }
    
    
    func loadMoreTopic() {
        self.page = self.page + 1
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 20.0
        let parameter = NSMutableDictionary()
        parameter.setValue("list", forKey: "a")
        parameter.setValue("data", forKey: "c")
        parameter.setValue(self.type.rawValue, forKey:"type")
        parameter.setValue(self.page, forKey: "page")
        parameter.setValue(self.maxtime, forKey: "maxtime")
        manager.GET(XMGMainURL, parameters: parameter, success: { (_, jsonrequestobject) -> Void in
            var dic = jsonrequestobject!["info"] as! NSDictionary
            let maxtimes = dic .valueForKey("maxtime") as!NSString
            self.maxtime = maxtimes
            let models:[BSBTopic] = BSBTopic.dict2Model(jsonrequestobject!["list"] as! [[String:AnyObject]])
            for  model in models{
                self.datasource.append(model)
            }
            self.tableView.mj_footer.endRefreshing()
            self.tableView.reloadData()
        }) { (_, error)  -> Void in
            self.page = self.page - 1
            self.tableView.mj_footer.endRefreshing()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.datasource.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        
//        if (!nibsRegistered) {
//           
//            self.nibsRegistered = true;
//        }
//        
//  
//        print(datasource.count)
//
//        var cell = tableView.dequeueReusableCellWithIdentifier("topicsId", forIndexPath: indexPath) as? BSBTopicCell
        
        
        
        let cell  = tableView.dequeueReusableCellWithIdentifier("topics" ) as! BSBTopicCell
        
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("topics", forIndexPath: indexPath)as! BSBTopicCell
//        print(cell.topicinfo?.profile_image)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
    
        cell.topicinfo = self.datasource[indexPath.row]
//        print(cell.topicinfo?.profile_image)
        
        return cell
        
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        let topicinfo :BSBTopic = self.datasource[indexPath.row]
//        print(topicinfo.cellHeight)
        
        return topicinfo.cellHeight
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
