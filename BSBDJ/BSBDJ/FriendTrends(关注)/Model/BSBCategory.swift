//
//  BSBCategory.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/17.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBCategory: NSObject {
    
    var id :NSInteger = 0
    var count:NSInteger = 0
    var name:String = ""
   
    
    
    
    //字典转数组
    class func dict2Model(list: [[String: AnyObject]]) -> [BSBCategory] {
        var models = [BSBCategory]()
        for dict in list
        {
            models.append(BSBCategory(dict: dict))
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


