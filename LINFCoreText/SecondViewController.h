//
//  SecondViewController.h
//  LINFCoreText
//
//  Created by Linf on 15/6/1.
//  Copyright (c) 2015年 FENGZuo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    LINF_CORETEXT_TYPE_FONT = 0,            // 设置字体
    LINF_CORETEXT_TYPE_ITALIC,              // 设置斜体
    LINF_CORETEXT_TYPE_DELETE_LINE,         // 设置删除线
    LINF_CORETEXT_TYPE_JUMP_URL,            // 设置URL跳转
    LINF_CORETEXT_TYPE_UNDER_LINE,          // 设置下划线
    LINF_CORETEXT_TYPE_KERN,                // 设置字符间隔
    LINF_CORETEXT_TYPE_FONT_COLOR,          // 设置字体颜色
    LINF_CORETEXT_TYPE_STROKE,              // 设置空心字
    LINF_CORETEXT_TYPE_CGSIZE,              // 设置自动获取段落多行所占宽高度
    LINF_CORETEXT_TYPE_BACKGROUND_COLOR,    // 设置背景颜色
    LINF_CORETEXT_TYPE_SHADOW,              // 设置阴影
    LINF_CORETEXT_TYPE_IMAGE_TEXT,          // 设置图文混排
}
LINF_CORETEXT_TYPE;

@interface SecondViewController : UIViewController

@property (nonatomic, assign) LINF_CORETEXT_TYPE type;

@end
