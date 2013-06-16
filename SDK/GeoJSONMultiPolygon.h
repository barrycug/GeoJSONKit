//
//  GeoJSONMultiPolygon.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONGeometry.h"
#import "GeoJSONPolygon.h"

@interface GeoJSONMultiPolygon : GeoJSONGeometry
{
    NSArray * _polygons;
}
-(id) initWithPolygons:(NSArray*)polygons;
-(id) initWithPolygons:(NSArray*)polygons bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(id) initWithJSON:(id )dictOrArray;
-(GeoJSONPolygon*) polygonAtIndex:(NSInteger)index;
-(NSInteger)numOfLinePolygons;
@end
