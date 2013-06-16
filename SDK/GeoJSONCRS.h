//
//  GeoJSONCRS.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum GeoJSONCRSType_e
{
    GeoJSONCRSType_Named = 0,
    GeoJSONCRSType_Link = 1
   }GeoJSONCRSType;

@interface GeoJSONCRS : NSObject
{
    GeoJSONCRSType _type;
}
@property(assign,nonatomic,readonly)GeoJSONCRSType type;
-(id) initWithGeoJSONCRSType:(GeoJSONCRSType)type;
@end
