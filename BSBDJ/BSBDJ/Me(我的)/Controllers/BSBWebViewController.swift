//
//  BSBWebViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/7/1.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBWebViewController: UIViewController {

    @IBOutlet weak var contentwebview: UIWebView!
    
    
     internal var url : NSString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.contentwebview.loadRequest(NSURLRequest(URL: NSURL(string:(self.url) as String)!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
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
