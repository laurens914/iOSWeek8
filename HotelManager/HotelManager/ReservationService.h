//
//  ReservationService.h
//  HotelManager
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Guest.h"
#import "Room.h"

@interface ReservationService : NSObject

+(void)bookReservationWithGuest:(Guest *)guest room:(Room *)room startDate:(NSDate *)start end:(NSDate *)end;
+(NSArray *)fetchAvailableRoomsForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

@end
