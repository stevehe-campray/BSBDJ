//
//  BSBRecommendUser.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/17.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBRecommendUser: NSObject {
    var screen_name:String = ""
    var header:String = ""
    var fans_count : NSInteger = 0
    var uid : String = ""
    
    
    //字典转数组
    class func dict2Model(list: [[String: AnyObject]]) -> [BSBRecommendUser] {
        var models = [BSBRecommendUser]()
        for dict in list
        {
            models.append(BSBRecommendUser(dict: dict))
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
