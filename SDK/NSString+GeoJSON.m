//
//  NSString+GeoJSON.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "NSString+GeoJSON.h"
#import "JSONKit.h"

@implementation NSString (GeoJSON)
-(GeoJSONFeatureCollection*) toGeoJSONFeatureCollection
{
    NSDictionary * dict = [self objectFromJSONString];
    GeoJSONFeatureCollection * fc = [[GeoJSONFeatureCollection alloc] initWithJSON: dict];
    return [fc autorelease];
}
@end
