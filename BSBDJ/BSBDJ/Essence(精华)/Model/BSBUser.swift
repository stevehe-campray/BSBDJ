//
//  BSBUser.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/23.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBUser: NSObject {
    
    
    var username : NSString = ""
    var sex : NSString = ""
    var profile_image : NSString = ""
    
    
    
    //字典数组转模型数组
    class func dict2Model(list: [[String: AnyObject]]) -> [BSBUser] {
        var models = [BSBUser]()
        for dict in list
        {
            models.append(BSBUser(dict: dict))
        }
        return models
    }
    
    // 字典转模型
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
