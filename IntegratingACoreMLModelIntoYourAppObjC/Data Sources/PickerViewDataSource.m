//
//  PickerViewDataSource.m
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/30/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.
//

#import "PickerViewDataSource.h"
#import "SolarPanelDataSource.h"
#import "GreenhousesDataSource.h"
#import "SizeDataSource.h"

@interface PickerViewDataSource()

@property (nonatomic,strong,readonly) SolarPanelDataSource *solarPanelsDataSource;
@property (nonatomic,strong,readonly) GreenhousesDataSource *greenhousesDataSource;
@property (nonatomic,strong,readonly) SizeDataSource *sizeDataSource;

@end

@implementation PickerViewDataSource

-(instancetype)init
{
    self = [super init];
    if (self) 
    {
        _solarPanelsDataSource = [[SolarPanelDataSource alloc]init];
        _greenhousesDataSource = [[GreenhousesDataSource alloc]init];
        _sizeDataSource = [[SizeDataSource alloc]init];
    }
    return self;
}

-(NSString*)titleForRow:(NSInteger)row feature:(Feature)feature
{
    switch (feature) 
    {
        case FeatureSolarPanels:
        {
            return [self.solarPanelsDataSource titleForIndex:row];
            break;
        }
        case FeatureGreenhouses:
        {
            return [self.greenhousesDataSource titleForIndex:row];
            break;
        }
        case FeatureSize:
        {
            return [self.sizeDataSource titleForIndex:row];
            break;
        }
            
        default:
        {
            NSAssert(NO, @"Invalid value passed to feature parameter: %li",feature);
        }
        break;
    }
}

-(double)valueForRow:(NSInteger)row feature:(Feature)feature
{
    switch (feature) 
    {
        case FeatureSolarPanels:
        {
            return [[self.solarPanelsDataSource valueForIndex:row]doubleValue];
            break;
        }
        case FeatureGreenhouses:
        {
            return [[self.greenhousesDataSource valueForIndex:row]doubleValue];
            break;
        }
        case FeatureSize:
        {
            return [[self.sizeDataSource valueForIndex:row]doubleValue];
            break;
        }
            
        default:
        {
            NSAssert(NO, @"Invalid value passed to feature parameter: %li",feature);
        }
        break;
    }
}

#pragma mark - Picker View Data Source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component
{
    Feature feature = (Feature)component;
    switch (feature) 
    {
        case FeatureSolarPanels:
        {
            return [self.solarPanelsDataSource.values count];
            break;
        }
            
        case FeatureGreenhouses:
        {
            return [self.greenhousesDataSource.values count];
            break;
        }
            
        case FeatureSize:
        {
            return [self.sizeDataSource.values count];
            break;
        }
            
        default:
        {
            NSAssert(NO, @"Unexpected component",component);
        }
        break;
    }
}


@end
