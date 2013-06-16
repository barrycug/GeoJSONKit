//
//  GeoJSONGeometryCollection.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONGeometry.h"

@interface GeoJSONGeometryCollection : GeoJSONGeometry
{
    NSArray *_geometries;
}
-(id) initWithGeometries:(NSArray*)geometries;
-(id) initWithGeometries:(NSArray*)geometries bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(id) initWithJSON:(id )dictOrArray;
-(GeoJSONGeometry*) geometryAtIndex:(NSInteger)index;
-(NSInteger)numOfGeometries;
@end
