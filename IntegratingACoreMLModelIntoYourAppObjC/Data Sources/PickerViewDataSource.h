//
//  PickerViewDataSource.h
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/30/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewDataSource : NSObject <UIPickerViewDataSource>

typedef NS_ENUM(NSInteger, Feature) {
    FeatureSolarPanels = 0,
    FeatureGreenhouses = 1,
    FeatureSize = 2
};

-(NSString*)titleForRow:(NSInteger)row feature:(Feature)feature;
-(double)valueForRow:(NSInteger)row feature:(Feature)feature;

@end
