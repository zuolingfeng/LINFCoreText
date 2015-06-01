//
//  ViewController.m
//  LINFCoreText
//
//  Created by Linf on 15/5/27.
//  Copyright (c) 2015年 FENGZuo. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ParagraphViewController.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CoreText";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - lazy loading
- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"设置字体", @"设置斜体", @"设置删除线", @"设置URL跳转", @"设置下划线", @"设置字符间隔", @"设置字体颜色", @"设置空心字", @"设置自动获取宽高度", @"设置背景色", @"设置阴影", @"设置图文混排", @"设置段落常用属性"];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"coreTextCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataSource.count - 1) {
        ParagraphViewController *paragraph = [[ParagraphViewController alloc] init];
        [self.navigationController pushViewController:paragraph animated:YES];
    } else {
        SecondViewController *second = [[SecondViewController alloc] init];
        second.title = self.dataSource[indexPath.row];
        switch (indexPath.row) {
            case 0:
                second.type = LINF_CORETEXT_TYPE_FONT;
                break;
            case 1:
                second.type = LINF_CORETEXT_TYPE_ITALIC;
                break;
            case 2:
                second.type = LINF_CORETEXT_TYPE_DELETE_LINE;
                break;
            case 3:
                second.type = LINF_CORETEXT_TYPE_JUMP_URL;
                break;
            case 4:
                second.type = LINF_CORETEXT_TYPE_UNDER_LINE;
                break;
            case 5:
                second.type = LINF_CORETEXT_TYPE_KERN;
                break;
            case 6:
                second.type = LINF_CORETEXT_TYPE_FONT_COLOR;
                break;
            case 7:
                second.type = LINF_CORETEXT_TYPE_STROKE;
                break;
            case 8:
                second.type = LINF_CORETEXT_TYPE_CGSIZE;
                break;
            case 9:
                second.type = LINF_CORETEXT_TYPE_BACKGROUND_COLOR;
                break;
            case 10:
                second.type = LINF_CORETEXT_TYPE_SHADOW;
                break;
            case 11:
                second.type = LINF_CORETEXT_TYPE_IMAGE_TEXT;
                break;
            default:
                break;
        }
        [self.navigationController pushViewController:second animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
