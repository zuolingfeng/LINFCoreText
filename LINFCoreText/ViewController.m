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
    NSMutableAttributedString *coreText = [[NSMutableAttributedString alloc] initWithString:@"This is a some test for CoreText form Linf.This is a some test for CoreText form Linf.This is a some test for CoreText form Linf\n I am the second line.This is a some test for CoreText form Linf.This is a some test for CoreText form Linf"];
    
    // 设置字体
    [coreText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Georgia" size:18.0f] range:NSMakeRange(0, coreText.length)];
    
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
    
    // 创建段落style类
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 10.0f;                                      // 行距
    paragraph.alignment = NSTextAlignmentLeft;                          // 对齐方式
    paragraph.firstLineHeadIndent = 20.0f;                              // 首行缩进
    paragraph.headIndent = 0.0f;                                       // 其余行缩进
    paragraph.tailIndent = 0.0f;                                        // 尾部缩进
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;                // 断行方式
    paragraph.maximumLineHeight = 25.0f;                                // 最大行高
    paragraph.minimumLineHeight = 15.0f;                                // 最小行高
    paragraph.paragraphSpacing = 20.0f;                                 // 段距
    paragraph.paragraphSpacingBefore = 0.0f;                           // 段首空间
    paragraph.baseWritingDirection = NSWritingDirectionNatural;         // 句子方向
    paragraph.lineHeightMultiple = 0.0f;                                // 行高倍数因子
    [coreText addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, coreText.length)];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    // 自动获取coreText所占CGSize
    CGSize labelSize = [coreText boundingRectWithSize:CGSizeMake(size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    NSLog(@"labelSize:%@", NSStringFromCGSize(labelSize));
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 20.0f, labelSize.width, labelSize.height)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.numberOfLines = 0;
    label.attributedText = coreText;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
