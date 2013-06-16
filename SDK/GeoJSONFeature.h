//
//  GeoJSONFeature.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoJSONGeometry.h"
#import "GeoJSONObject.h"
#import "GeoJSONBBox.h"
@interface GeoJSONFeature : GeoJSONObject
{
    id _fId;//fID 类型不确定
    GeoJSONGeometry * _geometry;
    NSDictionary * _properties;    
}
@property(retain,nonatomic,readonly)id fId;
@property(retain,nonatomic,readonly)GeoJSONGeometry *geometry;
@property(retain,nonatomic,readonly)NSDictionary *properties;
-(id)initWithFID:(id )fid geometry:(GeoJSONGeometry*)geometry properties:(NSDictionary*)properties;
-(id)initWithFID:(id )fid geometry:(GeoJSONGeometry*)geometry properties:(NSDictionary*)properties bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(id)initWithJSON:(id )dictOrArray;
@end
