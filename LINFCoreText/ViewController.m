//
//  ViewController.m
//  LINFCoreText
//
//  Created by Linf on 15/5/27.
//  Copyright (c) 2015年 FENGZuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试CoreText";
    
    // 创建NSMutableAttributedString
    NSMutableAttributedString *coreText = [[NSMutableAttributedString alloc] initWithString:@"This is a some test for CoreText form Linf"];
    
    // 设置字体
    [coreText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Georgia" size:18.0f] range:NSMakeRange(0, 4)];
    
    // 设置为斜体
    [coreText addAttribute:NSFontAttributeName value:[UIFont italicSystemFontOfSize:18.0f] range:NSMakeRange(5, 4)];
    
    // 设置下划线
    [coreText addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(0, 4)];
    
    // 设置下划线颜色
    [coreText addAttribute:NSUnderlineColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 4)];
    
    // 设置字符间隔
    [coreText addAttribute:NSKernAttributeName value:[NSNumber numberWithInt:5.0f] range:NSMakeRange(0, 4)];
    
    // 设置字体颜色
    [coreText addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 4)];
    
    // 设置字体
    [coreText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Georgia" size:18.0f] range:NSMakeRange(10, 4)];
    
    // 设置空心字
    [coreText addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithInt:3] range:NSMakeRange(10, 4)];
    
    // 设置空心字
    [coreText addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithInt:3] range:NSMakeRange(18, 4)];
    
    // 设置空心字颜色  注：设置此属性必须先设置为空心字
    [coreText addAttribute:NSStrokeColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(18, 4)];
    
    // 通过字典设置多个属性
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    [dic setObject:[UIFont italicSystemFontOfSize:18.0f] forKey:NSFontAttributeName];
    [dic setObject:[NSNumber numberWithInt:NSUnderlineStyleSingle] forKey:NSUnderlineStyleAttributeName];
    [coreText addAttributes:dic range:NSMakeRange(24, 4)];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, (size.height - 50.0f) / 2, size.width, 50.0f)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12.0f];
    [label setAttributedText:coreText];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
