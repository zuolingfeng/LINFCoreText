//
//  SecondViewController.m
//  LINFCoreText
//
//  Created by Linf on 15/6/1.
//  Copyright (c) 2015年 FENGZuo. All rights reserved.
//

#import "SecondViewController.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@interface SecondViewController () {
    CGSize labelSize;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSMutableAttributedString *coreText = [self attributedTextWithType:_type];
    
    if (_type == LINF_CORETEXT_TYPE_JUMP_URL) {
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, SCREEN_HEIGHT)];
        textView.backgroundColor = [UIColor clearColor];
        textView.userInteractionEnabled = YES;
        textView.attributedText = coreText;
        textView.editable = NO;        //必须禁止输入键盘，否则URL跳转无效
        [self.view addSubview:textView];
    } else if (_type == LINF_CORETEXT_TYPE_CGSIZE) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 64.0f, labelSize.width, labelSize.height)];
        label.backgroundColor = [UIColor lightGrayColor];
        label.attributedText = coreText;
        label.numberOfLines = 0;
        [self.view addSubview:label];
        
        UILabel *sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, CGRectGetMaxY(label.frame) + 20.0f, SCREEN_WIDTH, 30.0f)];
        sizeLabel.backgroundColor = [UIColor clearColor];
        sizeLabel.text = [NSString stringWithFormat:@"size=%@", NSStringFromCGSize(labelSize)];
        sizeLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:sizeLabel];
    } else {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, SCREEN_HEIGHT)];
        label.font = [UIFont systemFontOfSize:20.0f];
        label.textAlignment = NSTextAlignmentCenter;
        label.attributedText = coreText;
        [self.view addSubview:label];
    }
}

- (NSMutableAttributedString *) attributedTextWithType:(LINF_CORETEXT_TYPE)type {
    
    // 创建NSMutableAttributedString
    NSMutableAttributedString *coreText = [[NSMutableAttributedString alloc] initWithString:@"I am the test label"];
    NSShadow *shadow1 = [[NSShadow alloc] init];  //NSShadow 对象比较简单，只有3个属性：阴影颜色，模糊半径和偏移
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed: @"12.jpg"];  //设置图片源
    textAttachment.bounds = CGRectMake(0, 0, 30, 30);          //设置图片位置和大小
    NSAttributedString *coreText2 = [NSAttributedString attributedStringWithAttachment: textAttachment];
    switch (_type) {
        case LINF_CORETEXT_TYPE_FONT:
            // 设置字体
            [coreText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Georgia" size:28.0f] range:NSMakeRange(3, 5)];
            break;
        case LINF_CORETEXT_TYPE_ITALIC:
            // 设置为斜体
            [coreText addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:0.5f] range:NSMakeRange(3, 5)];
            break;
        case LINF_CORETEXT_TYPE_DELETE_LINE:
            // 设置删除线 value表示线条粗细
            [coreText addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(3, 5)];
            // 设置删除线颜色
            [coreText addAttribute:NSStrikethroughColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(3, 5)];
            break;
        case LINF_CORETEXT_TYPE_JUMP_URL:
            coreText = [[NSMutableAttributedString alloc] initWithString:@"check this to jump http://www.baidu.com"];
            // 设置字体
            [coreText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Georgia" size:20.0f] range:NSMakeRange(0, coreText.length)];
            // 设置URL跳转 UITextView才有效，UILabel和UITextField里面无效
            [coreText addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"http://www.baidu.com"] range:NSMakeRange(0, 10)];
            break;
        case LINF_CORETEXT_TYPE_UNDER_LINE:
            // 设置下划线
            [coreText addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(0, 8)];
            // 设置下划线颜色
            [coreText addAttribute:NSUnderlineColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 8)];
            break;
        case LINF_CORETEXT_TYPE_KERN:
            // 设置字符间隔
            [coreText addAttribute:NSKernAttributeName value:[NSNumber numberWithInt:8.0f] range:NSMakeRange(0, 8)];
            break;
        case LINF_CORETEXT_TYPE_FONT_COLOR:
            // 设置字体颜色
            [coreText addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 8)];
            break;
        case LINF_CORETEXT_TYPE_STROKE:
            // 设置字体
            [coreText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Georgia" size:28.0f] range:NSMakeRange(0, coreText.length)];
            // 设置空心字
            [coreText addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(0, 8)];
            // 设置空心字颜色  注：设置此属性必须先设置为空心字
            [coreText addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 8)];
            break;
        case LINF_CORETEXT_TYPE_CGSIZE:
            coreText = [[NSMutableAttributedString alloc] initWithString:@"This is a some test for CoreText form Linf.This is a some test for CoreText form Linf.This is a some test for CoreText form Linf\n I am the second line.This is a some test for CoreText form Linf.This is a some test for CoreText form Linf"];
            // 设置字体
            [coreText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Georgia" size:18.0f] range:NSMakeRange(0, coreText.length)];
            // 自动获取coreText所占CGSize 注意：获取前必须设置所有字体大小
            labelSize = [coreText boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
            break;
        case LINF_CORETEXT_TYPE_BACKGROUND_COLOR:
            // 设置背景颜色
            [coreText addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 8)];
            break;
        case LINF_CORETEXT_TYPE_SHADOW:
            shadow1.shadowOffset = CGSizeMake(2.0f, 2.0f);      //阴影偏移（X方向偏移和Y方向偏移）
            shadow1.shadowBlurRadius = 0.5;                     //模糊半径
            shadow1.shadowColor = [UIColor orangeColor];        //阴影颜色
            [coreText addAttribute:NSShadowAttributeName value:shadow1 range:NSMakeRange(0, 8)];
            break;
        case LINF_CORETEXT_TYPE_IMAGE_TEXT:
            [coreText insertAttributedString:coreText2 atIndex:2];  //NSTextAttachment占用一个字符长度，插入后原字符串长度增加1
            break;
        default:
            break;
    }
    return coreText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
