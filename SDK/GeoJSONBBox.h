//
//  GeoJSONBBox.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GeoJSONCoding.h"
@interface GeoJSONBBox : NSObject<GeoJSONCoding>
@property(assign,nonatomic,readonly)double xmin;
@property(assign,nonatomic,readonly)double ymin;
@property(assign,nonatomic,readonly)double xmax;
@property(assign,nonatomic,readonly)double ymax;
-(id) initWitXmin:(double)xmin ymin:(double)ymin xmax:(double)xmax ymax:(double)ymax;
-(id) initWithJSON:(id)dictOrArray;
@end
