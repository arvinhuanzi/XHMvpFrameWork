//
//  XHBaseTableVC.h
//  XHDesign
//
//  Created by cnest on 2019/9/27.
//  Copyright © 2019 huan. All rights reserved.
//

#import "XHBaseVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface XHBaseTableVC : XHBaseVC<UITableViewDelegate,UITableViewDataSource>

///表格
@property(weak,nonatomic)UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
