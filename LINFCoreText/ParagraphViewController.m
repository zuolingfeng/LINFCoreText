//
//  ParagraphViewController.m
//  LINFCoreText
//
//  Created by Linf on 15/6/1.
//  Copyright (c) 2015年 FENGZuo. All rights reserved.
//

#import "ParagraphViewController.h"
#import "ParagraphSecondViewController.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@interface ParagraphViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ParagraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置段落常用属性";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - lazy loading
- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"段落正常表现", @"段落首行缩进", @"段落行距", @"段落对齐方式", @"其余行缩进", @"断行方式", @"段距"];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    if (!_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
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
    ParagraphSecondViewController *second = [[ParagraphSecondViewController alloc] init];
    second.title = self.dataSource[indexPath.row];
    switch (indexPath.row) {
        case 0:
            second.type = LINF_PARAGRAPH_TYPE_NORMAL;
            break;
        case 1:
            second.type = LINF_PARAGRAPH_TYPE_FIRSTLINEINDENT;
            break;
        case 2:
            second.type = LINF_PARAGRAPH_TYPE_LINESPACE;
            break;
        case 3:
            second.type = LINF_PARAGRAPH_TYPE_ALIGNMENT;
            break;
        case 4:
            second.type = LINF_PARAGRAPH_TYPE_HEADINDENT;
            break;
        case 5:
            second.type = LINF_PARAGRAPH_TYPE_LINEBREAKMODE;
            break;
        case 6:
            second.type = LINF_PARAGRAPH_TYPE_PARAGRAPHSPACE;
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:second animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
