//
//  GeoJSONMultiPoint.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONGeometry.h"

@class GeoJSONPoint;
@interface GeoJSONMultiPoint : GeoJSONGeometry
{
    NSArray *_points;
}

-(id) initWithPoints:(NSArray*)points; //NSVale CGPoint array
-(id) initWithPoints:(NSArray*)points bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(NSInteger)numOfPoints;
-(id) initWithJSON:(id)dictOrArray;
-(GeoJSONPoint*) pointAtIndex:(NSInteger) index;

@end
