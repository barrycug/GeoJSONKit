//
//  GeoJSONMultiPoint.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONMultiPoint.h"
#import "GeoJSONPoint.h"
@implementation GeoJSONMultiPoint
-(void)dealloc
{
    if (_points != nil) {
        [_points release];
        _points = nil;
    }
    [super dealloc];
}
-(id) initWithPoints:(NSArray*)points
{
      return [self initWithPoints:points bbox:nil crs:nil];
}
-(id) initWithPoints:(NSArray*)points bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs
{
    if (self = [super initWithType:GeoJSONObjectType_Geom_MultiPoint bBox:bbox crs:crs]) {
         _points = [points retain];
    }
    return self;
}
/*
 { "type": "MultiPoint",
 "coordinates": [ [100.0, 0.0], [101.0, 1.0] ]
 }
 */
-(id) initWithJSON:(id)dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    GeoJSONBBox *bbox = [GeoJSONObject bboxFromJSON:dictOrArray];
    GeoJSONCRS * crs = [GeoJSONObject crsFromJSON:dictOrArray];
    NSDictionary * dictGeom = (NSDictionary *)dictOrArray;
    NSArray * array = [dictGeom objectForKey:@"coordinates"];
    NSMutableArray * mArray = [[NSMutableArray alloc] initWithCapacity:[array count] ];
    for (NSArray * cArray in array) {
        CGPoint p = CGPointMake([[cArray objectAtIndex:0] doubleValue], [[cArray objectAtIndex:1] doubleValue]);
        NSValue * v = [NSValue valueWithCGPoint:p];
        [mArray addObject:v];
        
    }
    [self initWithPoints:mArray bbox:bbox crs:crs];
    [mArray release];
    return self;
}
-(NSInteger)numOfPoints
{
    return [_points count];
}
-(GeoJSONPoint*) pointAtIndex:(NSInteger) index
{
    if (index < [_points count]) {
        NSValue * v = [_points objectAtIndex:index];
        GeoJSONPoint *p = [[[GeoJSONPoint alloc] initWithX:v.CGPointValue.x y:v.CGPointValue.y] autorelease];
        return p;
    }
    return  nil;
}
@end
