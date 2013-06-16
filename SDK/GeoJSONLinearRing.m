//
//  GeoJSONLinearRing.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONLinearRing.h"
#import "GeoJSONPoint.h"

@implementation GeoJSONLinearRing

-(void)dealloc
{
    if (_linearRingPoints != nil) {
        [_linearRingPoints release];
        _linearRingPoints = nil;
    }
    [super dealloc];
}
-(id) initWithPoints:(NSArray*)points
{
    if (self = [super init]) {
        _linearRingPoints = [points retain];
    }
    return self;
}

-(id) initWithJSON:(id)dictOrArray
{
    if (dictOrArray == nil ||  ![dictOrArray isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSDictionary * dictGeom = (NSDictionary *)dictOrArray;
    NSArray * array = [dictGeom objectForKey:@"coordinates"];
    NSMutableArray * mArray = [[NSMutableArray alloc] initWithCapacity:[array count] ];
    for (NSArray * cArray in array) {
        CGPoint p = CGPointMake([[cArray objectAtIndex:0] doubleValue], [[cArray objectAtIndex:1] doubleValue]);
        NSValue * v = [NSValue valueWithCGPoint:p];
        [mArray addObject:v];
        
    }
    [self initWithPoints:mArray];
    [mArray release];
    return self;

}
-(NSInteger)numOfPoints
{
    return [_linearRingPoints count];
}
-(GeoJSONPoint*) pointAtIndex:(NSInteger) index
{
    if (index < [_linearRingPoints count]) {
        NSValue * v = [_linearRingPoints objectAtIndex:index];
        GeoJSONPoint *p = [[[GeoJSONPoint alloc] initWithX:v.CGPointValue.x y:v.CGPointValue.y] autorelease];
        return p;
    }
    return  nil;
}
@end
