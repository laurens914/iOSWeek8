//
//  DateViewController.m
//  HotelManager
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "DateViewController.h"
#import "AvailabilityViewController.h"

@interface DateViewController ()

@property (strong, nonatomic) UIDatePicker *startPicker;
@property (strong, nonatomic) UIDatePicker *endPicker;
@end

@implementation DateViewController

-(void)loadView{
    [super loadView];
    [self setupCustomLayout];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDateViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)setupCustomLayout
{
    UIDatePicker *startPicker = [[UIDatePicker alloc]init];
    UIDatePicker *endPicker = [[UIDatePicker alloc]init];
    
    startPicker.datePickerMode = UIDatePickerModeDate;
    endPicker.datePickerMode = UIDatePickerModeDate;
    
    startPicker.translatesAutoresizingMaskIntoConstraints = NO;
    endPicker.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:startPicker];
    [self.view addSubview:endPicker];
    
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    NSArray *startPickerHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[startPicker]|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(startPicker)];
    NSArray *endPickerHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[endPicker]|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(endPicker)];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[startPicker]-20-[endPicker]" options:NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(startPicker, endPicker)];
    
    [constraints addObjectsFromArray:startPickerHorizontalConstraints];
    [constraints addObjectsFromArray:endPickerHorizontalConstraints];
    [constraints addObjectsFromArray:verticalConstraints];
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = YES;
    }
    self.startPicker = startPicker;
    self.endPicker = endPicker;
}


-(void)setupDateViewController{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"Select Dates"];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonSelected:)]];
}
     
-(void)doneButtonSelected: (UIBarButtonItem*)sender{
    NSDate *currentDate = [NSDate date];
    self.startPicker.minimumDate = currentDate;
    if([self.startPicker.date timeIntervalSinceReferenceDate]>= [self.endPicker.date timeIntervalSinceReferenceDate]){
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Date Error" message:@"End Date Must Come After Start Date" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.startPicker setDate:[NSDate date]];
            [self.endPicker setDate:[NSDate date]];
        }];
        [controller addAction:okAction];
        [self presentViewController:controller animated:YES completion:nil];
    }
    
    else {
        AvailabilityViewController *availabiltyViewController = [[AvailabilityViewController alloc]init];
        availabiltyViewController.startDate = self.startPicker.date;
        availabiltyViewController.endDate = self.endPicker.date;
        
        [self.navigationController pushViewController:availabiltyViewController animated:YES];
    }
    
}


@end
