//
//  SolarPanelDataSource.h
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/30/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SolarPanelDataSource : NSObject

/// Possible values for solar panels in the habitat
@property (nonnull,nonatomic, strong, readonly) NSArray<NSNumber*>*values;

-(nullable NSString*)titleForIndex:(NSInteger)index;
-(nullable NSNumber*)valueForIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
