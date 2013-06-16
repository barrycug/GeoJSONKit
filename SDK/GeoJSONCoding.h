//
//  GeoJSONCoding.h
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GeoJSONCoding <NSObject>
-(id) initWithJSON:(id )dictOrArray;
@end
