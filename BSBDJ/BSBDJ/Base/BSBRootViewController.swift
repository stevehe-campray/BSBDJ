//
//  BSBRootViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖保佑             永无BUG
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

import UIKit

class BSBRootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(BSBTabBar(), forKeyPath: "tabBar")
        setupChlidviewController()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //重写类方法
    
    override class func initialize(){
      
        let appearance:UITabBarItem = UITabBarItem.appearance()
        
        var attrdictionary:NSDictionary = NSDictionary()
        
//        attrdictionary.setValue(UIColor.darkGrayColor(), forKey: NSForegroundColorAttributeName)
        
        attrdictionary = [NSForegroundColorAttributeName:UIColor.darkGrayColor()]
        appearance.setTitleTextAttributes(attrdictionary as? [String : AnyObject], forState: UIControlState.Selected)
        UITabBar.appearance().backgroundImage = UIImage(named:"tabbar-light")
        
    }
    
    
    //设置tabbar上的控制器
    private func setupChlidviewController(){
        //设置精华控制器
        setoneViewConroller(BSBEssenceViewController(), title: "精华", imageName: "tabBar_essence_icon", selectImageName: "tabBar_essence_click_icon")
        //设置新帖控制器
        setoneViewConroller(BSBNewViewController(), title: "最新", imageName: "tabBar_new_icon", selectImageName: "tabBar_new_click_icon")
        //设置关注控制器
        setoneViewConroller(BSBFriendTrendsViewController(nibName:"BSBFriendTrendsViewController", bundle:nil), title: "关注", imageName: "tabBar_friendTrends_icon", selectImageName: "tabBar_friendTrends_click_icon")
        //设置个人中心控制器
        setoneViewConroller(BSBMeViewController(style: UITableViewStyle.Grouped), title: "我", imageName: "tabBar_me_icon", selectImageName: "tabBar_me_click_icon");
        
    }
    


    //设置单一控制器
    private func setoneViewConroller(viewController:UIViewController,  title:String, imageName:String, selectImageName:String){
        viewController.tabBarItem.title = title;
//        viewController.view.backgroundColor = UIColor.orangeColor()
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImageName)
        addChildViewController(BSBNavViewController(rootViewController: viewController))
        
        
    }
    
    
}
