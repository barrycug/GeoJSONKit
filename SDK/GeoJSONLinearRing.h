//
//  GeoJSONLinearRing.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoJSONCoding.h"
@class GeoJSONPoint;
@interface GeoJSONLinearRing : NSObject<GeoJSONCoding>
{
    NSArray *_linearRingPoints;
}
-(id) initWithPoints:(NSArray*)points; //NSVale CGPoint array
-(NSInteger)numOfPoints;
-(id) initWithJSON:(id)dictOrArray;
-(GeoJSONPoint*) pointAtIndex:(NSInteger) index;
@end
