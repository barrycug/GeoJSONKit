//
//  GeoJSONObject.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONObject.h"
#import "GeoJSONBBox.h"
#import "GeoJSONCRS.h"
#import "GeoJSONNamedCRS.h"
#import "GeoJSONLinkCRS.h"
@implementation GeoJSONObject
@synthesize bbox = _bbox;
@synthesize crs = _crs;
-(void)dealloc
{
    if (_bbox != nil) {
        [_bbox release];
        _bbox = nil;
    }
    if (_crs != nil) {
        [_crs release];
        _crs = nil;
    }
    [super dealloc];
}
-(id) initWithJSON:(id)dictOrArray
{
    GeoJSONObjectType type = [GeoJSONObject typeFromJSON:dictOrArray];
    GeoJSONBBox *bbox = [GeoJSONObject bboxFromJSON:dictOrArray];
    GeoJSONCRS * crs = [GeoJSONObject crsFromJSON:dictOrArray];
    if (self = [self initWithType:type bBox:bbox crs:crs]) {
        ;
    }
    return self;
}
+(GeoJSONObjectType)typeFromJSON:(id)dictOrArray
{
    if (dictOrArray == nil || ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return GeoJSONObjectType_NONE;
    }
    GeoJSONObjectType type =GeoJSONObjectType_NONE;
    NSString * strType = [[dictOrArray objectForKey:@"type"] lowercaseString];
    
    if ([strType isEqualToString:@"featurecollection"]) {
        type = GeoJSONObjectType_FeatureCollection;
    }
    else if([strType isEqualToString:@"feature"]) {
        type = GeoJSONObjectType_Feature;
    }
    else if([strType isEqualToString:@"point"]) {
        type = GeoJSONObjectType_Geom_Point;
    }
    else if([strType isEqualToString:@"linestring"]) {
        type = GeoJSONObjectType_Geom_LineString;
    }
    else if([strType isEqualToString:@"olygon"]) {
        type = GeoJSONObjectType_Geom_Polygon;
    }
    else if([strType isEqualToString:@"multipoint"]) {
        type = GeoJSONObjectType_Geom_MultiPoint;
    }
    else if([strType isEqualToString:@"multilinestring"]) {
        type = GeoJSONObjectType_Geom_MultiLineString;
    }
    else if([strType isEqualToString:@"multipolygon"]) {
        type = GeoJSONObjectType_Geom_MultiPolygon;
    }
    else if([strType isEqualToString:@"geometrycollection"]) {
        type = GeoJSONObjectType_GeometryCollection;
    }
    return type;
}
+(GeoJSONBBox*)bboxFromJSON:(id)dictOrArray
{
    if (dictOrArray == nil || ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSArray * bboxAray = [dictOrArray objectForKey:@"bbox"];
    GeoJSONBBox * bbox = nil;
    if (bboxAray != nil) {
        bbox= [[[GeoJSONBBox alloc] initWithJSON:bboxAray] autorelease];
    }
    return bbox;
}
+(GeoJSONCRS*)crsFromJSON:(id)dictOrArray
{
    if (dictOrArray == nil || ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSDictionary * dictCrs = [dictOrArray objectForKey:@"crs"];
    GeoJSONCRS * crs = nil;
    if (dictCrs != nil) {
        
        NSString * strCrsType = [dictCrs objectForKey:@"type"];
        if ([[strCrsType lowercaseString] isEqualToString:@"name"]) {
            crs = [[[GeoJSONNamedCRS alloc] initWithJSON:dictCrs] autorelease];
        }else if([[strCrsType lowercaseString] isEqualToString:@"link"]) {
            crs = [[[GeoJSONLinkCRS alloc] initWithJSON:dictCrs] autorelease];
        }
    }
    return crs;
}
-(id) initWithType:(GeoJSONObjectType)type bBox:(GeoJSONBBox *)bbox crs:(GeoJSONCRS*)crs;
{
    if (self = [super init]) {
        _type = type;
        _bbox = [bbox retain];
        _crs = [crs retain];
    }
    return self;
}
@end
