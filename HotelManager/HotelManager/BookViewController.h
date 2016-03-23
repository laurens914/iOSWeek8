//
//  BookViewController.h
//  HotelManager
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"

@interface BookViewController : UIViewController

@property (strong, nonatomic)Room *room;
@property (strong, nonatomic)NSDate *startDate;
@property (strong, nonatomic)NSDate *endDate;

@end
