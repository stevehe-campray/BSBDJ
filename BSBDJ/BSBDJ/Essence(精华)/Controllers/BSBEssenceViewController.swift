//
//  BSBEssenceViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBEssenceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    private var tableview : UITableView = UITableView()
    var dataSource : NSMutableArray = NSMutableArray()
    var buttonarray : NSMutableArray = NSMutableArray()
    
    var indecatorview : UIView = UIView()
    var selectbutton : UIButton = UIButton()
    var contentview : UIScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavgationBar()
        setUpMainInterface()
        setUpTitleView()
         setUpBgScollview()
        
       
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     设置navgationbar
     */
    func setUpNavgationBar(){
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        let leftbutton = UIButton()
        leftbutton.setBackgroundImage(UIImage(named: "MainTagSubIcon"), forState: UIControlState.Normal)
        leftbutton.setBackgroundImage(UIImage(named: "MainTagSubIconClick"), forState: UIControlState.Highlighted)
        let width = leftbutton.currentBackgroundImage?.size.width
        let height = leftbutton.currentBackgroundImage?.size.height
        leftbutton.bounds = CGRect(x: 0, y: 0, width:width!, height:height!)
        leftbutton.addTarget(self, action: #selector(BSBEssenceViewController.menuclick), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftbutton)
    }
    
    /**
     设置主界面
     */
    func setUpMainInterface(){
        self.view.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.8)
        tableview = UITableView(frame: CGRectMake(0,  35, self.view.frame.width, self.view.frame.height))
        tableview.delegate = self
        tableview.dataSource = self
        let view = UIView.init()
        tableview.tableFooterView = view
        
        
        let allvc = BSBTopicViewController()

        allvc.type = XMGTopicsType.XMGTopicsTypeAll
        
        let videovc = BSBTopicViewController()

        videovc.type = XMGTopicsType.XMGTopicsTypeVideo
        
        let voicevc = BSBTopicViewController()
        voicevc.type = XMGTopicsType.XMGTopicsTypeVoice

        let picturevc = BSBTopicViewController()
        picturevc.type = XMGTopicsType.XMGTopicsTypePicture
        
        let wordvc = BSBTopicViewController()
        wordvc.type = XMGTopicsType.XMGTopicsTypeWord
        
        self.addChildViewController(allvc)
        self.addChildViewController(videovc)
        self.addChildViewController(voicevc)
        self.addChildViewController(picturevc)
        self.addChildViewController(wordvc)
        
        
        
        
        
//        self.view.addSubview(tableview)
    }
    
    func setUpBgScollview(){
        self.automaticallyAdjustsScrollViewInsets = false;
        let contentview = UIScrollView.init()
        contentview.xmg_width = self.view.frame.width
        contentview.xmg_height = self.view.xmg_height
//        let bottom = self.tabBarController?.tabBar.xmg_height
        contentview.pagingEnabled = true;
        contentview.delegate = self
        contentview.contentSize = CGSizeMake(self.view.xmg_width * CGFloat(Float(self.childViewControllers.count)), 0)
//        self.view.addSubview(contentview)
        self.view .insertSubview(contentview, atIndex: 0)
        self.contentview = contentview;
        self.scrollViewDidEndDecelerating(contentview)// 添加第一个控制器的view
       
    }
    
    func setUpTitleView(){
        
//        let titleview = UIView.init(frame: CGRectMake(0, 64,self.view.frame.width, 35))
        let titleview = UIView.init()
        titleview.xmg_width = self.view.frame.width
        titleview.xmg_height = 35
        titleview.xmg_y = 64
        
        titleview.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
        self.view.addSubview(titleview)
        
        let titlearray = ["全部","视频","声音","图片","段子"]
        
        let width = self.view.frame.width / 5
        
        
        /**
         *  创建顶部视图
         */
        for i in 0  ..< 5{
//            let button = UIButton.init(frame: CGRectMake(CGFloat(Float(i)) * width, 0, width, 35))
            let button = UIButton.init()
            button.xmg_width = width
            button.xmg_height = titleview.xmg_height
            button.xmg_x = CGFloat(Float(i)) * width
            
            button.setTitle(titlearray[i], forState: UIControlState.Normal)
            button.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            button.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)
            button.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
//            button.layoutIfNeeded() //强制更新子控件
            button.addTarget(self, action:#selector(BSBEssenceViewController.buttonCliked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            buttonarray.addObject(button)
            button.titleLabel?.font = UIFont.systemFontOfSize(14)
            button.tag = 100 + i
            titleview .addSubview(button)
            if ( i==0) {
                button.titleLabel?.sizeToFit()
                selectbutton = button
                selectbutton.selected = true
            
//                self .buttonCliked(button)
            }
        }
        
        /**
         创建顶部标签的底部
         */
        
        let indecatorview = UIView.init()
        indecatorview.xmg_height = 2
        indecatorview.xmg_y = 33
        indecatorview.xmg_width = (selectbutton.titleLabel?.xmg_width)!;
        indecatorview.xmg_centerX = selectbutton.xmg_centerX;
        indecatorview.backgroundColor=UIColor.redColor()
        titleview .addSubview(indecatorview)
        self.indecatorview = indecatorview


        titleview.bringSubviewToFront(indecatorview)

        
    }
    
    func buttonCliked(sender:UIButton) {
        if !selectbutton .isEqual(sender) {
            selectbutton.selected = false
            sender.selected = true
            selectbutton = sender
        }
        UIView.animateWithDuration(0.25) {
            self.indecatorview.xmg_width = (sender.titleLabel?.xmg_width)!;
            self.indecatorview.xmg_centerX = sender.xmg_centerX;
            
        }
        
        // 滚动
        var offset = self.contentview.contentOffset;
        offset.x = CGFloat(Float(sender.tag  - 100)) * self.contentview.xmg_width;
        self.contentview.setContentOffset(offset, animated:true)
        
    }
    /**
     
    tableview 代理方法
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "testcell")
        cell.textLabel?.text="test"
        return cell;
    }
    
    /**
     menu按钮点击
     */
    func menuclick(){
        let subscribvc : BSBSubscribeController = BSBSubscribeController(nibName: "BSBSubscribeController",bundle: nil)
        self.navigationController?.pushViewController(subscribvc, animated: true)
    }
    
    
    /**
     UIScrollview 代理
     */
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / self.view.xmg_width
        let tablevc = self.childViewControllers[Int(index)] as!UITableViewController
        tablevc.view.xmg_x = scrollView.contentOffset.x
        tablevc.view.xmg_y = 0 //设置控制器view的y值为0(默认是20)

        tablevc.view.xmg_height = scrollView.xmg_height// 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
        let bottom = self.tabBarController?.tabBar.xmg_height
        tablevc.tableView.contentInset = UIEdgeInsetsMake(99, 0, bottom!, 0)
        tablevc.tableView.scrollIndicatorInsets = tablevc.tableView.contentInset
        
        scrollView.addSubview(tablevc.view)
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        self.scrollViewDidEndScrollingAnimation(scrollView)
        
        
        // 点击按钮
        let index = scrollView.contentOffset.x / scrollView.xmg_width;
        let button = self.buttonarray[Int(index)]
        
       self.buttonCliked(button as! UIButton)
    }
}
