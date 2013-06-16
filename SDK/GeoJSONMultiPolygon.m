//
//  GeoJSONMultiPolygon.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONMultiPolygon.h"
#import "GeoJSONLinearRing.h"
#import "GeoJSONPolygon.h"
@implementation GeoJSONMultiPolygon
-(void)dealloc
{
    if (_polygons != nil) {
        [_polygons release];
        _polygons = nil;
    }
    [super dealloc];
}
-(id) initWithPolygons:(NSArray*)polygons
{
    return [self initWithPolygons:polygons bbox:nil crs:nil];
}
-(id) initWithPolygons:(NSArray*)polygons bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs
{
    if (self = [super initWithType:GeoJSONObjectType_Geom_MultiPolygon bBox:bbox crs:crs]) {
        _polygons = [polygons retain];
    }
    return self;
}
-(id) initWithJSON:(id )dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    GeoJSONBBox *bbox = [GeoJSONObject bboxFromJSON:dictOrArray];
    GeoJSONCRS * crs = [GeoJSONObject crsFromJSON:dictOrArray];
    NSDictionary * dictGeom = (NSDictionary *)dictOrArray;
    NSArray * array = [dictGeom objectForKey:@"coordinates"];
    NSMutableArray * polygonsArray = [[NSMutableArray alloc] initWithCapacity:[array count] ];
    for ( NSArray * psArray in array)
    {
        NSMutableArray * rArray = [[NSMutableArray alloc] initWithCapacity:[psArray count] ];
        for (NSArray * lArray in psArray)
        {
            NSMutableArray * mArray = [[NSMutableArray alloc] initWithCapacity:[lArray count] ];
            for (NSArray *cArray in lArray)
            {
                CGPoint p = CGPointMake([[cArray objectAtIndex:0] doubleValue], [[cArray objectAtIndex:1] doubleValue]);
                NSValue * v = [NSValue valueWithCGPoint:p];
                [mArray addObject:v];
                
            }
            GeoJSONLinearRing * ring = [[GeoJSONLinearRing alloc] initWithPoints:mArray];
            [mArray release];
            [rArray addObject:ring];
            
        }
        GeoJSONPolygon * polygon = [[GeoJSONPolygon alloc] initWithRings:rArray bbox:bbox crs:crs];
        [polygonsArray addObject:polygon];
        [rArray release];

    }
    [self initWithPolygons:polygonsArray];
    [polygonsArray release];
    return self;
}
-(GeoJSONPolygon*) polygonAtIndex:(NSInteger)index
{
    if (index < [_polygons count]) {
        return [_polygons objectAtIndex:index];
    }
    return nil;
}
-(NSInteger)numOfLinePolygons
{
    return [_polygons count];
}
@end
