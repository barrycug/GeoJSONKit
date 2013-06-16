//
//  GeoJSONLinkCRS.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/16/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "GeoJSONCRS.h"
#import "GeoJSONCoding.h"
@interface GeoJSONLinkCRS : GeoJSONCRS<GeoJSONCoding>
{
    NSString * _linkType;
    NSString * _href;
}
@property(retain,nonatomic,readonly)NSString * href;
@property(retain,nonatomic,readonly)NSString * linkType;
-(id)initWithHref:(NSString*)href linkType:(NSString*) linkType;
-(id)initWithJSON:(id )dictOrArray;
@end
