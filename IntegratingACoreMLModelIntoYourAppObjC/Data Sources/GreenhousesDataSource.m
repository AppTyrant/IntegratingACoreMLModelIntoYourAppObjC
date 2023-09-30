//
//  GreenhousesDataSource.m
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/30/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.
//

#import "GreenhousesDataSource.h"

@implementation GreenhousesDataSource

-(instancetype)init
{
    self = [super init];
    if (self) 
    {
        _values = @[@1, @2, @3, @4, @5];
    }
    return self;
}

-(nullable NSString*)titleForIndex:(NSInteger)index
{
    if (index < self.values.count) 
    {
        NSNumber *number = self.values[index];
        return number.stringValue;
    }
    else
    {
        return nil;
    }
}

-(nullable NSNumber*)valueForIndex:(NSInteger)index
{
    if (index < self.values.count) 
    {
        return self.values[index];
    }
    else
    {
        return nil;
    }
}

@end
