//
//  FeedViewController.m
//  CoordinatorKit-Demo
//
//  Created by zhangwen on 2018/1/2.
//  Copyright © 2018年 zhangwen. All rights reserved.
//

#import "FeedViewController.h"
#import "Feed.h"
@interface FeedViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *feeds;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Feed";
    _feeds = [Feed fakeFeeds];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    Feed *feed = self.feeds[indexPath.row];
    cell.textLabel.text = feed.title;
    cell.detailTextLabel.text = feed.date;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didClickedFeed:)]) {
        [self.delegate didClickedFeed:self.feeds[indexPath.row]];
    }
}

@end
