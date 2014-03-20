//
//  ResultsViewController.m
//  DraughtPick
//
//  Created by Scott James on 3/18/14.
//  Copyright (c) 2014 Scott James. All rights reserved.
//

#import "ResultsViewController.h"
#import "DetailViewController.h"

@interface ResultsViewController ()
@property (strong, nonatomic) NSArray *resultsArray;
@end

@implementation ResultsViewController

- (id)initWithSearchString:(NSString *)str
{
    self = [super init];
    if (self) {
        
        NSURL *searchURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://immense-thicket-8918.herokuapp.com/search?name=%@", [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSLog(@"searchURL %@", searchURL);
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData* data = [NSData dataWithContentsOfURL: searchURL];
            [self performSelectorOnMainThread:@selector(fetchedData:)
                                   withObject:data waitUntilDone:YES];
        });
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary *dict = (NSDictionary *)[self.resultsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dict objectForKey:@"name"];
    cell.detailTextLabel.text = [[[dict objectForKey:@"breweries"] objectAtIndex:0] objectForKey:@"name"];
    
    NSLog(@"%@", [[[dict objectForKey:@"breweries"] objectAtIndex:0] objectForKey:@"name"]);
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultsArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [self.resultsArray objectAtIndex:indexPath.row];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithId:[dict objectForKey:@"id"] andName:[dict objectForKey:@"name"]];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    self.resultsArray = (NSArray *)[json objectForKey:@"data"];
    
    NSLog(@"JSON: \n%@", json);
    
    [self.resultsTableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
