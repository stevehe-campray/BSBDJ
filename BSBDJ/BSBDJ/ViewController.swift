//
//  ViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/14.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame:CGRect(x: 50, y: 100, width: 50, height: 50))
        button.addTarget(self, action:#selector(ViewController.buttonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.whiteColor();
        self.view.addSubview(button)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.redColor();
    }
    
    
    func buttonPressed(btn: UIButton){
        
        print("1111111")
    }
}

