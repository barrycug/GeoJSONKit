//
//  GeoJSONMultiLineString.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONMultiLineString.h"
#import "GeoJSONLineString.h"
@implementation GeoJSONMultiLineString
-(void)dealloc
{
    if (_lineStrings != nil) {
        [_lineStrings release];
        _lineStrings = nil;
    }
    [super dealloc];
}
-(id) initWithLineStrings:(NSArray*)lineStrings
{

    return [self initWithLineStrings:lineStrings bbox:nil crs:nil];
}
-(id) initWithLineStrings:(NSArray*)lineStrings bbox:(GeoJSONBBox*) bbox crs:(GeoJSONCRS*) crs
{
    if (self = [super initWithType:GeoJSONObjectType_Geom_MultiLineString bBox:bbox crs:crs]) {
         _lineStrings = [lineStrings retain];
    }
    return self;
}
-(id) initWithJSON:(id )dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    GeoJSONBBox *bbox = [GeoJSONObject bboxFromJSON:dictOrArray];
    GeoJSONCRS * crs = [GeoJSONObject crsFromJSON:dictOrArray];
    NSDictionary * dictGeom = (NSDictionary *)dictOrArray;
    NSArray * array = [dictGeom objectForKey:@"coordinates"];
    NSMutableArray * lsArray = [[NSMutableArray alloc] initWithCapacity:[array count] ];
    for (NSArray * lArray in array) {
        NSMutableArray * mArray = [[NSMutableArray alloc] initWithCapacity:[lArray count] ];
        for (NSArray *cArray in lArray) {
            CGPoint p = CGPointMake([[cArray objectAtIndex:0] doubleValue], [[cArray objectAtIndex:1] doubleValue]);
            NSValue * v = [NSValue valueWithCGPoint:p];
            [mArray addObject:v];
            
        }
        GeoJSONLineString * lineString = [[GeoJSONLineString alloc] initWithPoints:mArray];
        [mArray release];
        [lsArray addObject:lineString];
        [lineString release];
        
    }
    self = [self initWithLineStrings:lsArray bbox:bbox crs:crs];
    [lsArray release];
    return self;

}

-(GeoJSONLineString*) lineStringAtIndex:(NSInteger)index
{
    if (index < [_lineStrings count]) {
        return [_lineStrings objectAtIndex:index]; 
    }
    return nil;
}

-(NSInteger)numOfLineStrings
{
    return [_lineStrings count];
}

@end
