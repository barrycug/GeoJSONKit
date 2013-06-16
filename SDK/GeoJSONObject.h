//
//  GeoJSONObject.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoJSONCoding.h"
@class GeoJSONBBox;
@class GeoJSONCRS;
typedef enum GeoJSONObjectType_e
{
    GeoJSONObjectType_NONE = 0,
    GeoJSONObjectType_FeatureCollection = 1,
    GeoJSONObjectType_Feature = 2,
    GeoJSONObjectType_Geom_Point = 3,
    GeoJSONObjectType_Geom_LineString = 4,
    GeoJSONObjectType_Geom_Polygon = 5,
    GeoJSONObjectType_Geom_MultiPoint = 6,
    GeoJSONObjectType_Geom_MultiLineString = 7,
    GeoJSONObjectType_Geom_MultiPolygon = 8,
    GeoJSONObjectType_GeometryCollection = 9
}GeoJSONObjectType;
@interface GeoJSONObject : NSObject<GeoJSONCoding>
{
    GeoJSONBBox * _bbox;
    GeoJSONCRS  * _crs;
    GeoJSONObjectType _type;
}
@property(retain,nonatomic,readonly)GeoJSONBBox * bbox;
@property(retain,nonatomic,readonly)GeoJSONCRS  * crs;
@property(assign,nonatomic,readonly)GeoJSONObjectType type;

-(id) initWithType:(GeoJSONObjectType)type bBox:(GeoJSONBBox *)bbox crs:(GeoJSONCRS*)crs;

+(GeoJSONObjectType)typeFromJSON:(id)dictOrArray;
+(GeoJSONBBox*)bboxFromJSON:(id)dictOrArray;
+(GeoJSONCRS*)crsFromJSON:(id)dictOrArray;

@end
