//
//  GeoJSONPoint.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GeoJSONGeometry.h"
@interface GeoJSONPoint:GeoJSONGeometry
{
    CGPoint _point;
}
@property(assign,nonatomic,readonly)double x;
@property(assign,nonatomic,readonly)double y;
-(id) initWithX:(double)x y:(double)y;
-(id) initWithX:(double)x y:(double)y bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(id) initWithJSON:(id)dictOrArray;
@end
