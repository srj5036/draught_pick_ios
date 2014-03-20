//
//  DetailViewController.m
//  DraughtPick
//
//  Created by Scott James on 3/18/14.
//  Copyright (c) 2014 Scott James. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

- (id)initWithId:(NSString *)id andName:(NSString *)name
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        NSURL *searchURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://immense-thicket-8918.herokuapp.com/beer/%@", [id stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSLog(@"searchURL %@", searchURL);
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData* data = [NSData dataWithContentsOfURL: searchURL];
            [self performSelectorOnMainThread:@selector(fetchedData:)
                                   withObject:data waitUntilDone:YES];
        });
        
        self.navigationItem.title = name;
    }
    return self;
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    self.scoreLabel.text = [json objectForKey:@"ba_score"];
    self.nameLabel.text = [json objectForKey:@"name"];
    self.breweryLabel.text = [json objectForKey:@"brewery"];
    self.typeLabel.text = [json objectForKey:@"style"];
    self.descTextView.text = [json objectForKey:@"description"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
