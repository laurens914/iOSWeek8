//
//  ReservationService.m
//  HotelManager
//
//  Created by Lauren Spatz on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ReservationService.h"
#import "NSManagedObjectContext+Additions.h"
#import "Reservation.h"


@implementation ReservationService

+(void)bookReservationWithGuest:(Guest *)guest room:(Room *)room startDate:(NSDate *)start end:(NSDate *)end
{
    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:context];
    
    reservation.room = room;
    reservation.startDate = start;
    reservation.endDate = end;
    reservation.guests = guest;
    room.reservation = reservation;
    guest.reservation = reservation;
    
    NSError *saveError;
    [context save:&saveError];
    
    if(saveError)
    {
        NSLog(@"Save Error. Error: %@", saveError.localizedDescription);
    }
}

+(NSArray *)fetchAvailableRoomsForStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    NSError *fetchError;
    
    NSFetchRequest *reservationRequest = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    reservationRequest.predicate = [NSPredicate predicateWithFormat:@"startDate <= %@ AND endDate => %@", endDate, startDate];
    
    NSMutableArray *unavailableRooms = [[NSMutableArray alloc]init];
    NSArray *reservations = [context executeFetchRequest:reservationRequest error:&fetchError];
    
    for (Reservation *reservation in reservations) {
        [unavailableRooms addObject:reservation.room];
    }
    if (fetchError){
        NSLog(@"Error fetching. Error: %@", fetchError.localizedDescription);
    }
    
    NSFetchRequest *roomRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
    roomRequest.predicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", unavailableRooms];
    roomRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES],[NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES]];
    
    NSArray * results = [context executeFetchRequest:roomRequest error:&fetchError];
    
    if (fetchError){
        NSLog(@"Error fetching. Error: %@", fetchError.localizedDescription);
    }
    
    
    return results;
}

+(NSArray *)fetchReservationsWithGuestName:(NSString *)name
{
    NSManagedObjectContext *context = [NSManagedObjectContext currentContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
    request.predicate = [NSPredicate predicateWithFormat:@"guests.firstName CONTAINS %@ OR guests.lastName CONTAINS %@ OR guests.emailAddress CONTAINS %@", name, name, name];
    NSError *error;
    NSArray *reservation = [context executeFetchRequest:request error:&error];
    if (error){
        NSLog(@"%@", error.localizedDescription);
    }
    return reservation;
}


















@end
