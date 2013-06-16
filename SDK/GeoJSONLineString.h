//
//  GeoJSONLineString.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoJSONGeometry.h"
@class GeoJSONPoint;
@interface GeoJSONLineString : GeoJSONGeometry
{
    NSArray *_lineStringPoints;
}
-(id) initWithPoints:(NSArray*)points;//NSVale CGPoint array
-(id) initWithPoints:(NSArray*)points bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(id) initWithJSON:(id)dictOrArray;
-(NSInteger)numOfPoints;
-(GeoJSONPoint*) pointAtIndex:(NSInteger) index;

@end
