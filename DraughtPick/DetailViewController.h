//
//  DetailViewController.h
//  DraughtPick
//
//  Created by Scott James on 3/18/14.
//  Copyright (c) 2014 Scott James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
- (id)initWithId:(NSString *)id andName:(NSString *)name;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *breweryLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;

@end
