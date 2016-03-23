//
//  NSManagedObjectContext+Additions.m
//  HotelManager
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "NSManagedObjectContext+Additions.h"
#import "AppDelegate.h"

@implementation NSManagedObjectContext (Additions)

+(NSManagedObjectContext *)currentContext
{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    return delegate.managedObjectContext;
}

@end
