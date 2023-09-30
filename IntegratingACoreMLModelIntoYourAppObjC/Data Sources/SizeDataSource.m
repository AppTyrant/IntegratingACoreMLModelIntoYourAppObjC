//
//  SizeDataSource.m
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/29/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.
//

#import "SizeDataSource.h"

@interface SizeDataSource()

/// Helper formatter to represent large numbers in the picker
@property (class, nonatomic, strong, readonly) NSNumberFormatter *numberFormatter;

@end

@implementation SizeDataSource

-(instancetype)init
{
    self = [super init];
    if (self) 
    {
        _values = @[
            @750,
            @1000,
            @1500,
            @2000,
            @3000,
            @4000,
            @5000,
            @10000];
    }
    return self;
}

-(nullable NSString*)titleForIndex:(NSInteger)index 
{
    if (index < self.values.count) 
    {
        NSNumber *number = self.values[index];
        return [SizeDataSource.numberFormatter stringFromNumber:number];
    }
    return nil;
}

-(nullable NSNumber*)valueForIndex:(NSInteger)index
{
    if (index < self.values.count) {
        return self.values[index];
    }
    return nil;
}

#pragma mark - Getters
static NSNumberFormatter *NumberFormatter = nil;
+(NSNumberFormatter*)numberFormatter
{
    if (NumberFormatter == nil)
    {
        NumberFormatter = [[NSNumberFormatter alloc]init];
        NumberFormatter.locale = NSLocale.currentLocale;
        NumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        NumberFormatter.usesGroupingSeparator = YES;
    }
    return NumberFormatter;
}

@end
