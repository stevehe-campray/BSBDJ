//
//  BSBSquare.swift
//  BSBDJ
//
//  Created by hejingjin on 16/7/1.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBSquare: NSObject {
    
    /** 主题图片 */
    var icon : String = ""
    var name : String = ""
    var url : String = ""

    
    //字典数组转模型数组
    class func dict2Model(list: [[String: AnyObject]]) -> [BSBSquare] {
        var models = [BSBSquare]()
        for dict in list
        {
            models.append(BSBSquare(dict: dict))
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

