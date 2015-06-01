//
//  ParagraphSecondViewController.h
//  LINFCoreText
//
//  Created by Linf on 15/6/1.
//  Copyright (c) 2015年 FENGZuo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    LINF_PARAGRAPH_TYPE_NORMAL = 0,                 // 正常状态
    LINF_PARAGRAPH_TYPE_FIRSTLINEINDENT,            // 首行缩进
    LINF_PARAGRAPH_TYPE_LINESPACE,                  // 行距
    LINF_PARAGRAPH_TYPE_ALIGNMENT,                  // 对齐方式
    LINF_PARAGRAPH_TYPE_HEADINDENT,                 // 其余行缩进
    LINF_PARAGRAPH_TYPE_LINEBREAKMODE,              // 断行方式
    LINF_PARAGRAPH_TYPE_PARAGRAPHSPACE,             // 段距
}
LINF_PARAGRAPH_TYPE;

@interface ParagraphSecondViewController : UIViewController

@property (nonatomic, assign) LINF_PARAGRAPH_TYPE type;

@end
