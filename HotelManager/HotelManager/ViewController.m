//
//  ViewController.m
//  HotelManager
//
//  Created by Lauren Spatz on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ViewController.h"
#import "HotelViewController.h"
#import "DateViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)loadView{
    [super loadView];
    [self setupCustomLayout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewController];
    NSLog( @"%f",[[UIScreen mainScreen]bounds].size.width);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setupViewController{
    [self.navigationItem setTitle:@"Hotel Manager"];
}

-(void)setupCustomLayout{
    float navigationBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    UIButton *browseButton = [[UIButton alloc]init];
    UIButton *bookButton = [[UIButton alloc]init];
    UIButton *lookupButton = [[UIButton alloc]init];
   
    [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
    [bookButton setTitle:@"Book" forState:UIControlStateNormal];
    [lookupButton setTitle:@"Check for Reservation" forState:UIControlStateNormal];
    
    [browseButton setBackgroundColor:[UIColor colorWithRed:0.76 green:0.65 blue:1.0 alpha:1.0]];
    [bookButton setBackgroundColor:[UIColor colorWithRed:0.55 green:0.59 blue:0.91 alpha:1.0]];
    [lookupButton setBackgroundColor:[UIColor colorWithRed:0.56 green:0.80 blue:1.0 alpha:1.0]];

    [browseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bookButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [lookupButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [browseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bookButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lookupButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:browseButton];
    [self.view addSubview:bookButton];
    [self.view addSubview:lookupButton];

    
    
    NSLayoutConstraint *browseLeading = [NSLayoutConstraint constraintWithItem:browseButton
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *browseTop = [NSLayoutConstraint constraintWithItem:browseButton
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop multiplier:1.0 constant:navigationBarHeight];

    
    NSLayoutConstraint *browseTrailing = [NSLayoutConstraint constraintWithItem:browseButton
                                                              attribute:NSLayoutAttributeTrailing
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeTrailing
                                                                     multiplier:1.0
                                                                       constant:0.0];
    
    NSLayoutConstraint *browseHeight = [NSLayoutConstraint constraintWithItem:browseButton
                                                                    attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                       toItem:bookButton
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0];
    
    
    NSLayoutConstraint *bookLeading = [NSLayoutConstraint constraintWithItem:bookButton
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bookTop = [NSLayoutConstraint constraintWithItem:bookButton
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:browseButton
                                                                 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    
    NSLayoutConstraint *bookTrailing = [NSLayoutConstraint constraintWithItem:bookButton
                                                                    attribute:NSLayoutAttributeTrailing
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bookHeight = [NSLayoutConstraint constraintWithItem:bookButton
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:lookupButton
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0];
    

    NSLayoutConstraint *lookupLeading = [NSLayoutConstraint constraintWithItem:lookupButton
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookupTop = [NSLayoutConstraint constraintWithItem:lookupButton
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:bookButton
                                                                 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    
    NSLayoutConstraint *lookupTrailing = [NSLayoutConstraint constraintWithItem:lookupButton
                                                                    attribute:NSLayoutAttributeTrailing
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0];
   
    NSLayoutConstraint *lookupBottom = [NSLayoutConstraint constraintWithItem:lookupButton
                                                                      attribute:NSLayoutAttributeBottom
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *lookupHeight = [NSLayoutConstraint constraintWithItem:lookupButton
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:bookButton
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0];
    
   
    browseLeading.active = YES;
    browseTop.active = YES;
    browseTrailing.active = YES;
    bookLeading.active = YES;
    bookTop.active = YES;
    bookTrailing.active = YES;
    lookupLeading.active = YES;
    lookupTop.active = YES;
    lookupTrailing.active = YES;
    lookupBottom.active = YES;
    browseHeight.active = YES;
    bookHeight.active = YES;
    lookupHeight.active = YES;
    

    
    //add buttons as subviews ot the superview
    
    //set constraints to active
    
    // add selectors
    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    [bookButton addTarget:self action:@selector(bookButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    [lookupButton addTarget:self action:@selector(lookupButtonSelected) forControlEvents:UIControlEventTouchUpInside];


}

-(void)browseButtonSelected{
    [self.navigationController pushViewController:[[HotelViewController alloc]init]animated:YES];
    
}
-(void)bookButtonSelected{
    
[self.navigationController pushViewController:[[DateViewController alloc]init]animated:YES];
}
-(void)lookupButtonSelected{
    
  //
}

@end
