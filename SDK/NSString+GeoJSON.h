//
//  NSString+GeoJSON.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoJSONFeatureCollection.h"
@interface NSString (GeoJSON)
-(GeoJSONFeatureCollection*) toGeoJSONFeatureCollection;
@end
