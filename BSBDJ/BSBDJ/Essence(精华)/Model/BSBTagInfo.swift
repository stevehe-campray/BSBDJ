//
//  BSBTagInfo.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/18.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBTagInfo: NSObject {
    /** 主题图片 */
    var image_list : String = ""
    var is_default : NSInteger = 0
    var is_sub : NSInteger = 0
     /** 主题名 */
    var theme_name : String = ""
    var theme_id : String = ""
     /** 订阅数 */
    var sub_number : String = ""
    
    //字典数组转模型数组
    class func dict2Model(list: [[String: AnyObject]]) -> [BSBTagInfo] {
        var models = [BSBTagInfo]()
        for dict in list
        {
            models.append(BSBTagInfo(dict: dict))
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
