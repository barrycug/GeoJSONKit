//
//  GeoJSONNamedCRS.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONCRS.h"
#import "GeoJSONCoding.h"
@interface GeoJSONNamedCRS : GeoJSONCRS<GeoJSONCoding>
{
    NSString * _name;
}
@property(retain,nonatomic,readonly)NSString * name;
-(id)initWithName:(NSString*)name;
-(id)initWithJSON:(id )dictOrArray;
@end
