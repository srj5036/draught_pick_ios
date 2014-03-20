//
//  SearchViewController.m
//  DraughtPick
//
//  Created by Scott James on 3/18/14.
//  Copyright (c) 2014 Scott James. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultsViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    ResultsViewController *resultsViewController = [[ResultsViewController alloc] initWithSearchString:textField.text];
    
    [self.navigationController pushViewController:resultsViewController animated:YES];
    
    [self.searchTextField setClearsOnBeginEditing:YES];
    
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.searchTextField.delegate = self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
