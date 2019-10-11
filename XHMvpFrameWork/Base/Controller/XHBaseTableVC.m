//
//  XHBaseTableVC.m
//  XHDesign
//
//  Created by cnest on 2019/9/27.
//  Copyright © 2019 huan. All rights reserved.
//

#import "XHBaseTableVC.h"

@interface XHBaseTableVC ()

@end

@implementation XHBaseTableVC

-(void)initSubView{
    [super initSubView];
    //创建tableView
    [self tableView];
    
}


-(UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView=[[UITableView alloc] init];
        
        [self.cView addSubview:tableView];
        _tableView=tableView;
    }
    return _tableView;
}


#pragma mark  UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//
//}


#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
}



@end
