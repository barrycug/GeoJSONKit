//
//  GeoJSONNamedCRS.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONNamedCRS.h"

@implementation GeoJSONNamedCRS
@synthesize name = _name;
-(void) dealloc
{
    if (_name != nil) {
        [_name release];
        _name = nil;
    }
    [super dealloc];
}
-(id)initWithName:(NSString*)name
{
    if (self = [super initWithGeoJSONCRSType:GeoJSONCRSType_Named]) {
        _name = [name retain];
    }
    return self;
}
/*
 "crs": {
 "type": "name",
 "properties": {
 "name": "urn:ogc:def:crs:OGC:1.3:CRS84"
 }
 }
 */
-(id)initWithJSON:(id )dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSDictionary * dict = [dictOrArray objectForKey:@"properties"];
    NSString * name = [dict objectForKey:@"name"];
    return [self initWithName:name];
}

@end
