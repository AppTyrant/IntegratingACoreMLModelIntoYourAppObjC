//
//  GreenhousesDataSource.h
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/30/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GreenhousesDataSource : NSObject

/// Possible values for greenhouses in the habitat.
@property (nonnull,nonatomic, strong, readonly) NSArray<NSNumber*>*values;

-(nullable NSString*)titleForIndex:(NSInteger)index;
-(nullable NSNumber*)valueForIndex:(NSInteger)index;


@end
