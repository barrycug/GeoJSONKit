//
//  GeoJSONMultiLineString.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONGeometry.h"

@class GeoJSONLineString;
@interface GeoJSONMultiLineString : GeoJSONGeometry
{
    NSArray *_lineStrings;
}
-(id) initWithLineStrings:(NSArray*)lineStrings;
-(id) initWithLineStrings:(NSArray*)lineStrings bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(id) initWithJSON:(id )dictOrArray;
-(GeoJSONLineString*) lineStringAtIndex:(NSInteger)index;
-(NSInteger)numOfLineStrings;
@end
