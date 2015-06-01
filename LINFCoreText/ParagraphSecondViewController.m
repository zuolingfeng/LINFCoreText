//
//  ParagraphSecondViewController.m
//  LINFCoreText
//
//  Created by Linf on 15/6/1.
//  Copyright (c) 2015年 FENGZuo. All rights reserved.
//

#import "ParagraphSecondViewController.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@interface ParagraphSecondViewController ()

@end

@implementation ParagraphSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableAttributedString *coreText = [self attributedTextWithType:_type];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 64.0f, SCREEN_WIDTH, SCREEN_HEIGHT)];
    label.backgroundColor = [UIColor clearColor];
    label.attributedText = coreText;
    label.numberOfLines = 0;
    [self.view addSubview:label];
}

- (NSMutableAttributedString *) attributedTextWithType:(LINF_PARAGRAPH_TYPE)type {
    
    // 创建NSMutableAttributedString
    NSMutableAttributedString *coreText = [[NSMutableAttributedString alloc] initWithString:@"使用UITextView显示一段电影的简介，由于字数比较多，所以字体设置的很小，行间距和段间距也很小，一大段文字挤在一起看起来很别扭，想要把行间距调大，结果在XCode中查遍其所有属性才发现，UITextView居然没有调整行间距的接口，于是忍住不心里抱怨了一下下。\n但是问题还是要解决的，上网一查才发现，iOS不仅有富文本处理的功能，而且对于文字排版的处理能力那是相当的强大，看来我是孤陋寡闻了。"];
    
    // 设置字体
    [coreText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Georgia" size:14.0f] range:NSMakeRange(0, coreText.length)];
    
    // 创建段落style类
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    
    switch (type) {
        case LINF_PARAGRAPH_TYPE_FIRSTLINEINDENT:
            paragraph.firstLineHeadIndent = 20.0f;                              // 首行缩进
            break;
        case LINF_PARAGRAPH_TYPE_LINESPACE:
            paragraph.lineSpacing = 12.0f;                                      // 行距
            break;
        case LINF_PARAGRAPH_TYPE_ALIGNMENT:
            paragraph.alignment = NSTextAlignmentCenter;                        // 对齐方式
            break;
        case LINF_PARAGRAPH_TYPE_HEADINDENT:
            paragraph.headIndent = 20.0f;                                       // 其余行缩进
            break;
        case LINF_PARAGRAPH_TYPE_LINEBREAKMODE:
            paragraph.lineBreakMode = NSLineBreakByCharWrapping;                // 断行方式
            break;
        case LINF_PARAGRAPH_TYPE_PARAGRAPHSPACE:
            paragraph.paragraphSpacing = 20.0f;                                 // 段距
            break;
        default:
            break;
    }
    [coreText addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, coreText.length)];
    
    return coreText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
