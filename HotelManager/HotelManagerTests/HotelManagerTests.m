//
//  HotelManagerTests.m
//  HotelManagerTests
//
//  Created by Lauren Spatz on 3/23/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSManagedObjectContext+Additions.h"

@interface HotelManagerTests : XCTestCase
@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation HotelManagerTests

- (void)setUp {
    [super setUp];
    self.context = [NSManagedObjectContext currentContext];
}

- (void)tearDown {
    [super tearDown];
    self.context = nil;
}

- (void)testExample {
}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

-(void)testDatabaseInfo
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    request.resultType = NSCountResultType;
    NSArray *results = [self.context executeFetchRequest:request error:nil];
    NSNumber *count= results.firstObject;
    
    XCTAssert(count > 0, @"Database should not be empty");
}

@end
