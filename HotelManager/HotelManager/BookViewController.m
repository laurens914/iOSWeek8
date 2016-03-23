//
//  BookViewController.m
//  HotelManager
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "BookViewController.h"
#import "ReservationService.h"
#import "NSManagedObjectContext+Additions.h"

@interface BookViewController ()
@property (strong, nonatomic) UITextField *firstNameField;
@property (strong, nonatomic) UITextField *lastNameField;
@property (strong, nonatomic) UITextField *emailAddressField;

@end

@implementation BookViewController

-(void)loadView
{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupCustomLayout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupBookViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setupCustomLayout
{
    UITextField *firstNameField = [[UITextField alloc]init];
    firstNameField.placeholder = @"first name *required";
    firstNameField.borderStyle = UITextBorderStyleRoundedRect;
    
    UITextField *lastNameField = [[UITextField alloc]init];
    lastNameField.placeholder = @"last name *required";
    lastNameField.borderStyle = UITextBorderStyleRoundedRect;
    
    UITextField *emailAddressField = [[UITextField alloc]init];
    emailAddressField.placeholder = @"email address *required";
    emailAddressField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
    lastNameField.translatesAutoresizingMaskIntoConstraints = NO;
    emailAddressField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:emailAddressField];
    [self.view addSubview:lastNameField];
    [self.view addSubview:firstNameField];
    
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    NSArray *firstNameHorizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[firstNameField]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(firstNameField)];

    NSArray *emailAddressHorizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[emailAddressField]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(emailAddressField)];
    
    NSArray *lastNameHorizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[lastNameField]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views:NSDictionaryOfVariableBindings(lastNameField)];

    NSArray *verticalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-84-[firstNameField]-20-[lastNameField]-20-[emailAddressField]" options:NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(firstNameField, lastNameField, emailAddressField)];
    
    [constraints addObjectsFromArray:firstNameHorizontalConstraint];
    [constraints addObjectsFromArray:lastNameHorizontalConstraint];
    [constraints addObjectsFromArray:emailAddressHorizontalConstraint];
    [constraints addObjectsFromArray:verticalConstraint];
    
    for (NSLayoutConstraint *constraint in constraints) {
        constraint.active = YES;
    }
    self.firstNameField = firstNameField;
    self.lastNameField = lastNameField;
    self.emailAddressField = emailAddressField;


    
}


-(void)setupBookViewController
{
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonSelected:)]];
}

-(void)saveButtonSelected:(UIBarButtonItem *)sender
{
    if (self.firstNameField.text.length > 0 && self.lastNameField.text.length > 0 && self.emailAddressField.text.length > 0){
        
        NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
        Guest *guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
        guest.firstName = self.firstNameField.text;
        guest.lastName = self.lastNameField.text;
        guest.emailAddress = self.emailAddressField.text;
        
        [ReservationService bookReservationWithGuest:guest room:self.room startDate:self.startDate end:self.endDate];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Booking Error" message:@"Please fill in all required fields" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [controller addAction:okAction];
        [self presentViewController:controller animated:YES completion:nil];
    }
}


@end
