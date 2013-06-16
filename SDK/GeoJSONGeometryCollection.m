//
//  GeoJSONGeometryCollection.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONGeometryCollection.h"
#import "GeoJSONPoint.h"
#import "GeoJSONLineString.h"
#import "GeoJSONPolygon.h"
#import "GeoJSONMultiPoint.h"
#import "GeoJSONMultiLineString.h"
#import "GeoJSONMultiPolygon.h"
@implementation GeoJSONGeometryCollection

-(void)dealloc
{
    if (_geometries != nil) {
        [_geometries release];
        _geometries = nil;
    }
    [super dealloc];
}
-(id) initWithGeometries:(NSArray*)geometries
{
    return [self initWithGeometries:geometries bbox:nil crs:nil];
}
-(id) initWithGeometries:(NSArray*)geometries bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs
{
    
    if (self = [super initWithType:GeoJSONObjectType_GeometryCollection bBox:bbox crs:crs]) {
        _geometries = [geometries retain];
    }
    return self;
}
/*
 { "type": "GeometryCollection",
 "geometries": [
 { "type": "Point",
 "coordinates": [100.0, 0.0]
 },
 { "type": "LineString",
 "coordinates": [ [101.0, 0.0], [102.0, 1.0] ]
 }
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
    NSDictionary * dictGeometryCollection = (NSDictionary *)dictOrArray;
    NSArray * array = [dictGeometryCollection objectForKey:@"geometries"];
    NSMutableArray * gArray =[[NSMutableArray alloc] initWithCapacity:[array count]];
    for (NSDictionary * dict in array) {
        NSString * strType = [[dict objectForKey:@"type"] lowercaseString];
        if ([strType  isEqualToString:@"point"]) {
            GeoJSONPoint * point =[[GeoJSONPoint alloc] initWithJSON:dict];
            [gArray addObject:point];
            [point release];
        }
        else if ([strType  isEqualToString:@"linestring"]) {
            GeoJSONLineString * lineString = [[GeoJSONLineString alloc] initWithJSON:dict];
            [gArray addObject:lineString];
            [lineString release];
        }
        else if ([strType  isEqualToString:@"ploygon"]) {
            GeoJSONPolygon * polygon = [[GeoJSONPolygon alloc] initWithJSON:dict];
            [gArray addObject:polygon];
            [polygon release];
        }
        else if ([strType  isEqualToString:@"multipoint"]) {
            GeoJSONMultiPoint * mpoint =[[GeoJSONMultiPoint alloc] initWithJSON:dict];
            [gArray addObject:mpoint];
            [mpoint release];
        }
        else if ([strType  isEqualToString:@"multilinestring"]) {
            GeoJSONMultiLineString * mlineString =[[GeoJSONMultiLineString alloc] initWithJSON:dict];
            [gArray addObject:mlineString];
            [mlineString release];
        }
        else if ([strType  isEqualToString:@"multiploygon"]) {
            GeoJSONMultiPolygon * mpolygon =[[GeoJSONMultiPolygon alloc] initWithJSON:dict];
            [gArray addObject:mpolygon];
            [mpolygon release];
        }
    }
    [self initWithGeometries:gArray bbox:bbox crs:crs];
    [gArray release];
    return self;
}
-(GeoJSONGeometry*) geometryAtIndex:(NSInteger)index
{
    if (index < [_geometries count]) {
        return  [_geometries objectAtIndex:index];
    }
    return nil;
}
-(NSInteger)numOfGeometries
{
    return [_geometries count];
}
@end
