//
//  GeoJSONPolygon.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONGeometry.h"

/*
 Coordinates of a Polygon are an array of LinearRing coordinate arrays. The first element in the array represents the exterior ring. Any subsequent elements represent interior rings (or holes).
 */
@class  GeoJSONLinearRing;
@interface GeoJSONPolygon  : GeoJSONGeometry
{
    NSArray *_rings;
}
-(id) initWithRings:(NSArray*)rings;
-(id) initWithRings:(NSArray*)rings  bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(id) initWithJSON:(id )dictOrArray;
-(GeoJSONLinearRing*) ringAtIndex:(NSInteger)index;
-(NSInteger)numOfRings;
@end
