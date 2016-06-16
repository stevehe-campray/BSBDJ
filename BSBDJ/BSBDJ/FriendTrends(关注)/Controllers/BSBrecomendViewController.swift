//
//  BSBrecomendViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/16.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBrecomendViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var usertableview: UITableView!
    @IBOutlet weak var categorytableview: UITableView!
    private var categoryarray : NSArray = []
    private var userarray : [BSBRecommendUser] = []
    private var categoryid :NSInteger = 0
    private var nextpage :NSInteger = 1
    private var totalpage : NSInteger = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 229/255.0, green: 229/255.0, blue: 229/255.0, alpha: 1.0)
         setUpMainInterface()
        loadcategoryData()
       
        categorytableview!.registerNib(UINib(nibName: "BSBFriendTrendsCategoryCell", bundle:nil), forCellReuseIdentifier: "category")
        
        usertableview!.registerNib(UINib(nibName: "BSBRecommendUserCell", bundle: nil), forCellReuseIdentifier: "RecommendUser")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpMainInterface(){
        self.navigationItem.title = "推荐关注"
        self.usertableview.showsVerticalScrollIndicator = false
        self.usertableview.mj_header = MJRefreshNormalHeader(refreshingBlock: { () -> Void in
            self.loadusersData()
        })
        self.usertableview.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { () -> Void in
            if self.nextpage <= self.totalpage{
                self.loadMoreUsersData()
            }else{
                self.usertableview.mj_footer.endRefreshing()
            }
        })
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if tableView == categorytableview{
            return 44.0
        }else{
            return 50.0
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == categorytableview{
            
            let category : BSBCategory =  (self.categoryarray.objectAtIndex(indexPath.row) as? BSBCategory)!
            self.nextpage = 0
            self.categoryid = category.id
            self.usertableview.mj_header.beginRefreshing()
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == categorytableview {
          return categoryarray.count
        }else{
          return userarray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if(tableView == categorytableview){
            let cell  = BSBFriendTrendsCategoryCell.cellWithTableView(tableView)
            
            cell.category = self.categoryarray.objectAtIndex(indexPath.row) as? BSBCategory
            return cell
        }else{
            let cell  = BSBRecommendUserCell.cellWithTableview(tableView)
            let recommenduser : BSBRecommendUser = (userarray[indexPath.row] as? BSBRecommendUser)!
            cell.recommenduser = recommenduser
            return cell
        }
        
        
    }
    func loadcategoryData(){
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 20.0
        let parameter = NSMutableDictionary()
        parameter.setValue("category", forKey: "a")
        parameter.setValue("subscribe", forKey: "c")
        manager.GET(XMGMainURL, parameters: parameter, success: { (_, Json) -> Void in
            let models:[BSBCategory] = BSBCategory.dict2Model(Json!["list"] as! [[String:AnyObject]])
            self.categoryarray = models
            self.categorytableview.reloadData()
            self.categorytableview.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.Top)
            self.categoryid = models[0].id
            self.usertableview.mj_header.beginRefreshing()
        }) { (_, error) -> Void in
           print(error)
            
        }
    }
    
    func loadusersData(){
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 20.0
        let parameter = NSMutableDictionary()
        parameter.setValue("list", forKey: "a")
        parameter.setValue("subscribe", forKey: "c")
        parameter.setValue(categoryid, forKey: "category_id")
        manager.GET(XMGMainURL, parameters: parameter, success: { (_, JSON) -> Void in
            print(JSON)
            
            let models:[BSBRecommendUser] = BSBRecommendUser.dict2Model(JSON!["list"] as! [[String:AnyObject]])
            self.userarray = models
//            var nextpagestr:String =  as! String
            self.nextpage = JSON!["next_page"] as! NSInteger
            self.totalpage = JSON!["total_page"] as! NSInteger
            self.usertableview.reloadData()
            self.usertableview.mj_header.endRefreshing()
            }) { (_, error) -> Void in
            self.usertableview.mj_header.endRefreshing()
            print(error)
        }
    }
    
    func loadMoreUsersData(){
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 20.0
        let parameter = NSMutableDictionary()
        parameter.setValue("list", forKey: "a")
        parameter.setValue("subscribe", forKey: "c")
        parameter.setValue(categoryid, forKey: "category_id")
        parameter.setValue(nextpage, forKey: "page")
        manager.GET(XMGMainURL, parameters: parameter, success: { (_, JSON) -> Void in
            let models:[BSBRecommendUser] = BSBRecommendUser.dict2Model(JSON!["list"] as! [[String:AnyObject]])
            for  model in models{
                self.userarray.append(model)
            }
            self.usertableview.reloadData()
            self.usertableview.mj_footer.endRefreshing()
            }) { (_, error) -> Void in
             self.usertableview.mj_footer.endRefreshing()
        }
    }
}
