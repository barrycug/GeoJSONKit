//
//  GeoJSONFeature.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONFeature.h"
#import "GeoJSONPoint.h"
#import "GeoJSONLineString.h"
#import "GeoJSONPolygon.h"
#import "GeoJSONMultiPoint.h"
#import "GeoJSONMultiLineString.h"
#import "GeoJSONMultiPolygon.h"
@implementation GeoJSONFeature
@synthesize fId = _fId;
@synthesize geometry = _geometry;
@synthesize properties = _properties;
-(void)dealloc
{
    if (_fId != nil) {
        [_fId release];
        _fId = nil;
    }
    if (_geometry != nil) {
        [_geometry release];
        _geometry = nil;
    }
    if (_properties != nil) {
        [_properties release];
        _properties = nil;
    }
    [super dealloc];
}
-(id)initWithFID:(id )fid geometry:(GeoJSONGeometry*)geometry properties:(NSDictionary*)properties
{
    return  [self initWithFID:fid geometry:geometry properties:properties bbox:nil crs:nil];
}
-(id)initWithFID:(id )fid geometry:(GeoJSONGeometry*)geometry properties:(NSDictionary*)properties bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs
{
    if (self = [super initWithType:GeoJSONObjectType_Feature bBox:bbox crs:crs]) {
        _fId = [fid retain];
        _geometry = [geometry retain];
        _properties = [properties retain];
    }
    return self;
}
/*
 { "type": "Feature",
 "geometry": {"type": "Point", "coordinates": [102.0, 0.5]},
 "properties": {"prop0": "value0"}
 }
 */
-(id)initWithJSON:(id )dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    GeoJSONBBox *bbox = [GeoJSONObject bboxFromJSON:dictOrArray];
    GeoJSONCRS * crs = [GeoJSONObject crsFromJSON:dictOrArray];
    id fId = [dictOrArray objectForKey:@"id"];
    NSDictionary * dict = [dictOrArray objectForKey:@"geometry"];
    NSDictionary * properties = [dictOrArray objectForKey:@"properties"];
    NSString * strType = [[dict objectForKey:@"type"] lowercaseString];
    GeoJSONGeometry * geometry = nil;
    if ([strType  isEqualToString:@"point"]) {
        geometry =[[GeoJSONPoint alloc] initWithJSON:dict ];
    }
    else if ([strType  isEqualToString:@"linestring"]) {
        geometry = [[GeoJSONLineString alloc] initWithJSON:dict];

    }
    else if ([strType  isEqualToString:@"polygon"]) {
        geometry = [[GeoJSONPolygon alloc] initWithJSON:dict];

    }
    else if ([strType  isEqualToString:@"multipoint"]) {
        geometry =[[GeoJSONMultiPoint alloc] initWithJSON:dict];

    }
    else if ([strType  isEqualToString:@"multilinestring"]) {
        geometry =[[GeoJSONMultiLineString alloc] initWithJSON:dict];

    }
    else if ([strType  isEqualToString:@"multiploygon"]) {
        geometry =[[GeoJSONMultiPolygon alloc] initWithJSON:dict];

    }
    self = [self initWithFID:fId geometry:geometry properties:properties bbox:bbox crs:crs];
    [geometry release];
    return self;
    
}
@end
