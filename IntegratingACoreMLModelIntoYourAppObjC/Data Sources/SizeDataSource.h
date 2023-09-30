//
//  SizeDataSource.h
//  IntegratingACoreMLModelIntoYourAppObjC
//
//  Created by ANTHONY CRUZ on 9/29/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SizeDataSource : NSObject

/// Possible values for the size of the habitat.
@property (nonnull,nonatomic, strong,readonly) NSArray<NSNumber *> *values;

-(nullable NSString*)titleForIndex:(NSInteger)index;
-(nullable NSNumber*)valueForIndex:(NSInteger)index;


@end


