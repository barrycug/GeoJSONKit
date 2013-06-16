//
//  GeoJSONCRS.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONCRS.h"

@implementation GeoJSONCRS
@synthesize type = _type;
-(id) initWithGeoJSONCRSType:(GeoJSONCRSType)type
{
    if (self = [super init]) {
        _type = type;
    }
    
    return self;
}
@end
