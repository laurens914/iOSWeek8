//
//  NSManagedObjectContext+Additions.h
//  HotelManager
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Additions)

+(NSManagedObjectContext *) currentContext;

@end
