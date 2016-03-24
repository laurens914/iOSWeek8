//
//  LookupViewController.m
//  HotelManager
//
//  Created by Lauren Spatz on 3/23/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "LookupViewController.h"
#import "Reservation.h"
#import "Guest.h"
#import "Room.h"
#import "Hotel.h"
#import "ReservationService.h"

@interface LookupViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (strong, nonatomic) NSArray *datasource;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation LookupViewController


-(void)setDatasource:(NSArray *)datasource
{
    _datasource = datasource;
    
    [self.tableView reloadData];
}

-(void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupTableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupLookupViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setupLookupViewController
{
    [self.navigationItem setTitle:@"Lookup"];
}

-(void)setupTableView
{
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    
    NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[tableView]|" options:NSLayoutFormatAlignAllTop metrics:0 views:@{@"tableView":self.tableView}];
    NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:NSLayoutFormatAlignAllRight metrics:0 views:@{@"tableView":self.tableView}];
    [constraints addObjectsFromArray:tableViewHorizontalConstraints];
    [constraints addObjectsFromArray:tableViewVerticalConstraints];
    
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = YES;
    }
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datasource count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    Reservation *reservation = self.datasource[indexPath.row];
    cell.textLabel.text = reservation.guests.firstName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Hotel: %@, Room: %@", reservation.room.hotel.name, reservation.room.number];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.tableView.frame), 44.0);
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:frame];
    searchBar.delegate = self;
    return searchBar;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.datasource = [ReservationService fetchReservationsWithGuestName:searchBar.text];
}



@end
