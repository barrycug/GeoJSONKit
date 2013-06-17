//
//  GeoJSONFeatureCollection.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONFeatureCollection.h"
#import "GeoJSONFeature.h"
@implementation GeoJSONFeatureCollection
-(void)dealloc
{
    if (_features != nil) {
        [_features release];
        _features = nil;
    }
    [super dealloc];
}
-(id) initWithFeatures:(NSArray*)features
{
    return [self initWithFeatures:features bbox:nil crs:nil];
}
-(id) initWithFeatures:(NSArray*)features bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs
{
    if (self = [super initWithType:GeoJSONObjectType_FeatureCollection bBox:bbox crs:crs]) {
        _features = [features retain];
    }
    return self;
}

-(id) initWithJSON:(id )dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSString * type = [[dictOrArray objectForKey:@"type"] lowercaseString];
    if (![type isEqualToString:@"featurecollection"]) {
        return nil;
    }
    GeoJSONBBox *bbox = [GeoJSONObject bboxFromJSON:dictOrArray];
    GeoJSONCRS * crs = [GeoJSONObject crsFromJSON:dictOrArray];
    NSMutableArray * features = [[NSMutableArray alloc] initWithCapacity:[[dictOrArray objectForKey:@"features"] count]];
    for (NSDictionary * fDict in [dictOrArray objectForKey:@"features"]) {
        GeoJSONFeature *feature = [[GeoJSONFeature alloc] initWithJSON:fDict];
        [features addObject:feature];
        [feature release];
    }
    self = [self initWithFeatures:features bbox:bbox crs:crs];
    [features release];
    return self;
    
}

-(GeoJSONFeature*) featureAtIndex:(NSInteger)index
{
    if (index < [_features count]) {
        return [_features objectAtIndex:index];
    }
    return nil;
}

-(NSInteger)numOfFeatures
{
    return [_features count];
}

@end
