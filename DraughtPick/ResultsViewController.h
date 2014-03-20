//
//  ResultsViewController.h
//  DraughtPick
//
//  Created by Scott James on 3/18/14.
//  Copyright (c) 2014 Scott James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

- (id)initWithSearchString:(NSString *)str;

@property (weak, nonatomic) IBOutlet UITableView *resultsTableView;

@end
