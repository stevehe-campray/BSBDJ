//
//  BSBMeFooterView.swift
//  BSBDJ
//
//  Created by hejingjin on 16/7/1.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBMeFooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        // 参数
//        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        let  params = NSMutableDictionary()
        
        params.setValue("square", forKey: "a")
        params.setValue("topic", forKey: "c")
        
        let manager = AFHTTPSessionManager()
        
        manager.GET("http://api.budejie.com/api/api_open.php", parameters: params, success: { (_, JSON) -> Void in
            
            let models:[BSBSquare] = BSBSquare.dict2Model(JSON!["square_list"] as! [[String:AnyObject]])
            
            self.creatButtons(models)
        }) { (_, error) -> Void in
            print(error)
        }
    }
    
    func creatButtons(squares : [BSBSquare] ) {
        
        
        let maxCols : Int =  4
        
        
        // 宽度和高度
        let buttonW : CGFloat = UIScreen.mainScreen().bounds.size.width  / CGFloat(maxCols)
        let buttonH = buttonW;
        
      
//        let buttoncount  = squares.count
//        
//        if  buttoncount = {
//            <#code#>
//        }
        
        
        for i in 0...squares.count - 1 {
            let button = BSBSquareButton()
            button.square = squares[i]
            self.addSubview(button)
            
            
            // 计算frame
            let col = i % maxCols;
            let row = i / maxCols;
            
            button.xmg_x = CGFloat(col) * buttonW;
            button.xmg_y = CGFloat(row) * buttonH;
            button.xmg_width = buttonW;
            button.xmg_height = buttonH;
        }
        
 
        
        // 8个方块, 每行显示4个, 计算行数 8/4 == 2 2
        // 9个方块, 每行显示4个, 计算行数 9/4 == 2 3
        // 7个方块, 每行显示4个, 计算行数 7/4 == 1 2
        
        // 总行数
        //    NSUInteger rows = sqaures.count / maxCols;
        //    if (sqaures.count % maxCols) { // 不能整除, + 1
        //        rows++;
        //    }
        
        // 总页数 == (总个数 + 每页的最大数 - 1) / 每页最大数
        
        let rows = (squares.count + maxCols - 1) / maxCols;
        
        // 计算footer的高度
        self.xmg_height = CGFloat(rows) * buttonH;
        
       NSNotificationCenter.defaultCenter().postNotificationName("initsuccess", object: nil, userInfo: nil)
    }
    
    override func drawRect(rect: CGRect) {
//        super.drawRect(rect)
//        [[UIImage imageNamed:@"mainCellBackground"] drawInRect:rect];
        UIImage(named: "mainCellBackground")?.drawInRect(rect)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
