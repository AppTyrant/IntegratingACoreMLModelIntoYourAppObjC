//
//  SolarPanelDataSource.m
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/30/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.
//

#import "SolarPanelDataSource.h"

@implementation SolarPanelDataSource

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _values = @[@(1),
                    @(1.5),
                    @(2),
                    @(2.5),
                    @(3),
                    @(3.5),
                    @(4),
                    @(4.5),
                    @(5)];
    }
    return self;
}

-(nullable NSString*)titleForIndex:(NSInteger)index
{
    if (index < self.values.count)
    {
        NSNumber *number =[self.values objectAtIndex:index];
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
        return [self.values objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}

@end
