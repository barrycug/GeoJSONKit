//
//  GeoJSONBBox.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONBBox.h"

@implementation GeoJSONBBox
@synthesize xmin =_xmin;
@synthesize ymin = _ymin;
@synthesize xmax = _xmax;
@synthesize ymax = _ymax;
-(id) initWitXmin:(double)xmin ymin:(double)ymin xmax:(double)xmax ymax:(double)ymax
{
    if (self = [super init]) {
        _xmin = xmin;
        _ymin = ymin;
        _xmax = xmax;
        _ymax = ymax;        
    }
    return self;
}
-(id) initWithJSON:(id)dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSArray class]] || [dictOrArray count] != 4) {
        return nil;
    }
    NSArray * array = (NSArray *)dictOrArray;
    return [self initWitXmin:[[array objectAtIndex:0] doubleValue] ymin:[[array objectAtIndex:1] doubleValue] xmax:[[array objectAtIndex:2] doubleValue] ymax:[[array objectAtIndex:3] doubleValue]];
    
}
@end
