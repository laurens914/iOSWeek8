//
//  RoomViewController.h
//  HotelManager
//
//  Created by Lauren Spatz on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hotel+CoreDataProperties.h"
#import "Room+CoreDataProperties.h"

@interface RoomViewController : UIViewController

@property (strong, nonatomic) Hotel *selectedHotel;

@end
