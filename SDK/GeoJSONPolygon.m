//
//  GeoJSONPolygon.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONPolygon.h"
#import "GeoJSONLinearRing.h"

@implementation GeoJSONPolygon
-(void)dealloc
{
    if (_rings != nil) {
        [_rings release];
        _rings = nil;
    }
    [super dealloc];
}
-(id) initWithRings:(NSArray*)rings
{
    return [self initWithRings:rings bbox:nil crs:nil];
}
-(id) initWithRings:(NSArray*)rings  bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs
{
    if (self = [super initWithType:GeoJSONObjectType_Geom_Polygon bBox:bbox crs:crs]) {
        _rings = [rings retain];
    }
    return self;
}
/*
 { "type": "Polygon",
 "coordinates": [
 [ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0] ]
 ]
 }
 */
-(id) initWithJSON:(id )dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    GeoJSONBBox *bbox = [GeoJSONObject bboxFromJSON:dictOrArray];
    GeoJSONCRS * crs = [GeoJSONObject crsFromJSON:dictOrArray];
    NSDictionary * dictGeom = (NSDictionary *)dictOrArray;
    NSArray * array = [dictGeom objectForKey:@"coordinates"];
    NSMutableArray * rArray = [[NSMutableArray alloc] initWithCapacity:[array count] ];
    for (NSArray * lArray in array) {
         NSMutableArray * mArray = [[NSMutableArray alloc] initWithCapacity:[lArray count] ];
        for (NSArray *cArray in lArray) {
            CGPoint p = CGPointMake([[cArray objectAtIndex:0] doubleValue], [[cArray objectAtIndex:1] doubleValue]);
            NSValue * v = [NSValue valueWithCGPoint:p];
            [mArray addObject:v];
           
        }
        GeoJSONLinearRing * ring = [[GeoJSONLinearRing alloc] initWithPoints:mArray];
        [mArray release];
        [rArray addObject:ring];
        
    }
    [self initWithRings:rArray bbox:bbox crs:crs];
    [rArray release];
    return self;

}
-(GeoJSONLinearRing*) ringAtIndex:(NSInteger)index
{
    if (index < [_rings count]) {
        return [_rings objectAtIndex:index];
    }
    return nil;
}
-(NSInteger)numOfRings
{
    return [_rings count];
}
@end
