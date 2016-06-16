//
//  BSBLoginRegisterViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/24.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBLoginRegisterViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var registerPasswordTextField: UITextField!
    @IBOutlet weak var registerPhoneTextFeld: UITextField!
    @IBOutlet weak var logviewleftmargin: NSLayoutConstraint!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var bgbackgroundview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.insertSubview(self.bgbackgroundview, atIndex: 0)
        let phoneattrstr = NSMutableAttributedString(string: "手机号")
        phoneattrstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: 0,length: 3))
     
        let passwordattrstr = NSMutableAttributedString(string: "密码")
        passwordattrstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: 0,length: 2))
        
        let registerphoneattrstr = NSMutableAttributedString(string: "请输入手机号")
        phoneattrstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: 0,length: 3))
        
        let registerpasswordattrstr = NSMutableAttributedString(string: "输入密码")
        passwordattrstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: 0,length: 2))
        
        phoneField.attributedPlaceholder = phoneattrstr
        phoneField.tintColor = UIColor.whiteColor()
        passwordField.attributedPlaceholder = passwordattrstr;
        passwordField.tintColor = UIColor.whiteColor()
        
        registerPhoneTextFeld.tintColor = UIColor.whiteColor()
        registerPhoneTextFeld.attributedPlaceholder = registerphoneattrstr
        registerPasswordTextField.tintColor = UIColor.whiteColor()
        registerPasswordTextField.attributedPlaceholder = registerpasswordattrstr
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func closebutton(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil);
    
        
    }
   
    @IBAction func loginregister(sender: UIButton) {
        
        if(self.logviewleftmargin.constant == 0){
            self.logviewleftmargin.constant = -self.view.bounds.width;
            sender.selected = true;
            UIView.animateWithDuration(0.25) { () -> Void in
                self.view.layoutIfNeeded()
            }
        }else{
            sender.selected = false;
            self.logviewleftmargin.constant = 0;
            UIView.animateWithDuration(0.25) { () -> Void in
                self.view.layoutIfNeeded()
            }
        }
        
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let phoneattrstr = NSMutableAttributedString(string: "手机号")
        let passwordattrstr = NSMutableAttributedString(string: "密码")
        let registerphonestr = NSMutableAttributedString(string: "请输入手机号")
        let registerPasswordstr = NSMutableAttributedString(string: "输入密码");
        if(textField.isEqual(phoneField)){
            phoneattrstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location: 0,length: 3))
              passwordattrstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: 0,length: 2))
        }else if(textField.isEqual(passwordField)){
            phoneattrstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: 0,length: 3))
            passwordattrstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location: 0,length: 2))
        }else if(textField.isEqual(registerPhoneTextFeld)){
            registerphonestr.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location: 0,length: 6))
            registerPasswordstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: 0,length: 4))
        }else if(textField.isEqual(registerPasswordTextField)){
            registerphonestr.addAttribute(NSForegroundColorAttributeName, value: UIColor.grayColor(), range: NSRange(location: 0,length: 6))
            registerPasswordstr.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSRange(location: 0,length: 4))
        }
        phoneField.attributedPlaceholder = phoneattrstr
        passwordField.attributedPlaceholder = passwordattrstr
        registerPhoneTextFeld.attributedPlaceholder = registerphonestr;
        registerPasswordTextField.attributedPlaceholder = registerPasswordstr;
    }
    /**
     当前控制器对应状态栏颜色
     */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    
    
    func setUpMainInterface(){
        self.view.backgroundColor = UIColor.whiteColor();
    }
    
}
