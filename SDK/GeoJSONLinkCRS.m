//
//  GeoJSONLinkCRS.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONLinkCRS.h"

@implementation GeoJSONLinkCRS
@synthesize linkType = _linkType;
@synthesize href = _href;
-(void) dealloc
{
    if (_href != nil) {
        [_href release];
        _href = nil;
    }
    if (_linkType != nil) {
        [_linkType release];
        _linkType = nil;
    }
    [super dealloc];
}
-(id)initWithHref:(NSString*)href linkType:(NSString*) linkType
{
    if (self = [super initWithGeoJSONCRSType:GeoJSONCRSType_Link]) {
        _href = [href retain];
        _linkType = [linkType retain];
    }
    return self;
}
/*
 "crs": {
 "type": "link",
 "properties": {
 "href": "data.crs",
 "type": "ogcwkt"
 }
 }
 */
-(id)initWithJSON:(id )dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSDictionary * dict = [dictOrArray objectForKey:@"properties"];
    NSString * href = [dict objectForKey:@"href"];
    NSString * type = [dict objectForKey:@"type"];
    return [self initWithHref:href linkType:type];
}
@end
