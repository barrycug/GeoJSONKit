//
//  GeoJSONFeatureCollection.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONObject.h"
#import "GeoJSONFeature.h"

@interface GeoJSONFeatureCollection : GeoJSONObject
{
    NSArray *_features;
}
-(id) initWithFeatures:(NSArray*)features;
-(id) initWithFeatures:(NSArray*)features bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs;
-(id) initWithJSON:(id )dictOrArray;
-(GeoJSONFeature*) featureAtIndex:(NSInteger)index;
-(NSInteger)numOfFeatures;
@end
