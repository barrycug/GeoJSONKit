//
//  GeoJSONPoint.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONPoint.h"

@implementation GeoJSONPoint

-(id) initWithX:(double)x y:(double)y
{
   
    return [self initWithX:x y:y bbox:nil crs:nil];
    
}
-(double)x
{
    return _point.x;
}
-(double)y
{
    return _point.y;
}
/*
{ "type": "Point", "coordinates": [100.0, 0.0] }
 */
-(id) initWithX:(double)x y:(double)y bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs
{
    if (self = [super initWithType:GeoJSONObjectType_Geom_Point bBox:bbox crs:crs]) {
        _point.x = x;
        _point.y = y;
    }
    return self;
}
-(id) initWithJSON:(id)dictOrArray
{
   
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    GeoJSONBBox *bbox = [GeoJSONObject bboxFromJSON:dictOrArray];
    GeoJSONCRS * crs = [GeoJSONObject crsFromJSON:dictOrArray];
    NSDictionary * dictGeom = (NSDictionary *)dictOrArray;
    NSArray * array = [dictGeom objectForKey:@"coordinates"];
    if (array == nil || [array count] != 2) {
        return nil;
    }
    return [self initWithX:[[array objectAtIndex:0] doubleValue] y:[[array objectAtIndex:1] doubleValue] bbox:bbox crs:crs];

}
@end
