//
//  Reservation.h
//  HotelManager
//
//  Created by Lauren Spatz on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Guest, Room;

NS_ASSUME_NONNULL_BEGIN

@interface Reservation : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Reservation+CoreDataProperties.h"
