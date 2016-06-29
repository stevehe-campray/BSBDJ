//
//  BSBCommentViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/29.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//


import UIKit


class BSBCommentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var bottomSapce: NSLayoutConstraint!
    @IBOutlet weak var commentview: UIView!
    
    @IBOutlet weak var commetTableview: UITableView!
    
    private var hotcomment : [BSBComment] = [] //最热
    private var lastcomment : [BSBComment] = [] //最新
    var page : NSInteger = 0
    
    internal var topicinfo : BSBTopic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.8)
        self.setUpnavgation()
        
        self.setUptableHeader()
        
        self.setUpRefresh()
        
        self.commetTableview.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.8)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BSBCommentViewController.keybordechange(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
        
    }

    
    func setUpRefresh(){
        
        self.commetTableview.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(BSBCommentViewController.loadNewComment))
        self.commetTableview.mj_header.automaticallyChangeAlpha = true
        self.commetTableview.mj_header.beginRefreshing()
        
        
        //        self.tableView.registerClass(BSBTopicCell.self, forCellReuseIdentifier:"topicsId")
        self.commetTableview.mj_footer = MJRefreshBackNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(BSBCommentViewController.loadMoreComment))
    }
    //加载新数据
    func loadNewComment(){
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 20.0
        let parameter = NSMutableDictionary()
        parameter.setValue("dataList", forKey: "a")
        parameter.setValue("comment", forKey: "c")
        parameter.setValue(self.topicinfo?.id, forKey:"data_id")
        parameter.setValue("1", forKey:"hot")
        
        manager.GET("http://api.budejie.com/api/api_open.php", parameters: parameter, success: { (_, responseObj) in
            print(responseObj)
            self.page = 0
            self.hotcomment.removeAll()
            self.lastcomment.removeAll()
            let hotmodels:[BSBComment] = BSBComment.dict2Model(responseObj!["hot"] as! [[String:AnyObject]])
            for  model in hotmodels{
                self.hotcomment.append(model)
            }
            let lastmodels:[BSBComment] = BSBComment.dict2Model(responseObj!["data"] as! [[String:AnyObject]])
            for  model in lastmodels{
                self.lastcomment.append(model)
            }
            self.commetTableview.reloadData()
            self.commetTableview.mj_header.endRefreshing()
    
            }) { (_, error) in
            self.commetTableview.mj_header.endRefreshing()
        }
//        NSMutableDictionary *params = [NSMutableDictionary dictionary];
//        params[@"a"] = @"dataList";
//        params[@"c"] = @"comment";
//        params[@"data_id"] = self.topic.ID;
//        params[@"hot"] = @"1";
//        
//        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//        
    }
    
    
    //加载更多
    func loadMoreComment(){
        
    }
    
    func setUptableHeader(){
    
        let header = UIView()
//        header.backgroundColor = UIColor.redColor()
        let  topicCell = (NSBundle.mainBundle().loadNibNamed("BSBTopicCell", owner: nil, options: nil).last)as! BSBTopicCell
        topicCell.topicinfo = topicinfo

        topicCell.contentview.hidden = true
        if topicinfo?.commentH == 0 {
            topicCell.size = CGSizeMake(UIScreen.mainScreen().bounds.size.width,  (topicinfo?.cellHeight)!)
            header.xmg_height = (topicinfo?.cellHeight)! + 18
        }else{
            topicCell.size = CGSizeMake(UIScreen.mainScreen().bounds.size.width,  ((topicinfo?.cellHeight)!  - (topicinfo?.commentH)!))
            header.xmg_height = ((topicinfo?.cellHeight)!  - (topicinfo?.commentH)! ) + 18
        }
        
        header.addSubview(topicCell)
       
        
        
        
        self.commetTableview.tableHeaderView = header
        
        let footer = UIView()
        self.commetTableview.tableFooterView = footer
        
        
        
    }
    func setUpnavgation(){
        self.title = "评论"
        
        let rightbutton = UIButton()
        rightbutton.setBackgroundImage(UIImage(named: "comment_nav_item_share_icon"), forState: UIControlState.Normal)
        rightbutton.setBackgroundImage(UIImage(named: "comment_nav_item_share_icon_click"), forState: UIControlState.Highlighted)
        let width = rightbutton.currentBackgroundImage?.size.width
        let height = rightbutton.currentBackgroundImage?.size.height
        rightbutton.bounds = CGRect(x: 0, y: 0, width:width!, height:height!)
        rightbutton.addTarget(self, action: #selector(BSBCommentViewController.share), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightbutton)
        
    }
    
    func keybordechange(note:NSNotification) {
        let frame : CGRect = (note.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue())!
        self.bottomSapce.constant =  UIScreen.mainScreen().bounds.size.height - frame.origin.y
        let duration : Double = (note.userInfo![UIKeyboardAnimationDurationUserInfoKey]?.doubleValue)!
        UIView.animateWithDuration(duration) { 
            self.view.layoutIfNeeded()
        }
    
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            if hotcomment.count > 0 {
                return "最热评论"
            }else{
                return "最新评论"
            }
        }else{
            return "最新评论"
        }
    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label : UILabel = UILabel()
//        
//        label.text = "最热评论"
//        return nil
//        
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if hotcomment.count > 0 {
                return hotcomment.count
            }else{
                return lastcomment.count
            }
        }else{
            return lastcomment.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  : UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "11111"
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if lastcomment.count > 0 && hotcomment.count > 0 {
            return 2
        }else if lastcomment.count == 0 && hotcomment.count == 0{
            return 0
        }else{
            return 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        self.view.endEditing(true)
    }
    
    
    //相当于oc中的dealloc方法
     deinit {
        
         NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    
    func share(){
        
        
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
