//
//  SearchViewController.h
//  DraughtPick
//
//  Created by Scott James on 3/18/14.
//  Copyright (c) 2014 Scott James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end
