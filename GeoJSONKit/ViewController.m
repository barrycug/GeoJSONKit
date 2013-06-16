//
//  ViewController.m
//  GeoJSONKit
//
//  Created by zhang baocai on 6/15/13.
//  Copyright (c) 2013 igis.me. All rights reserved.
//

#import "ViewController.h"
#import "GeoJSON.h"
#import "NSString+GeoJSON.h"
#import "GeoJSONFeatureCollection.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString * strJson = @"{ \"type\": \"FeatureCollection\",\"crs\": {\"type\": \"name\", \"properties\": {\"name\": \"urn:ogc:def:crs:OGC:1.3:CRS84\"}},\"features\": [{ \"id\": \"1\",\"type\": \"Feature\",\"bbox\": [-180.0, -90.0, 180.0, 90.0],\"geometry\": {\"type\": \"Point\", \"coordinates\": [102.0, 0.5]},\"properties\": {\"prop0\": \"value0\"}},{ \"type\": \"Feature\",\"geometry\": {\"type\": \"LineString\",\"coordinates\": [[102.0, 0.0], [103.0, 1.0], [104.0, 0.0], [105.0, 1.0]]},\"properties\": {\"prop0\": \"value0\",\"prop1\": 0.0}},{ \"type\": \"Feature\",\"geometry\": {\"type\": \"Polygon\",\"coordinates\": [[ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0],[100.0, 1.0], [100.0, 0.0] ]]},\"properties\": {\"prop0\": \"value0\",\"prop1\": {\"this\": \"that\"}}}]}";
    NSString * url = @"http://www.somebits.com:8001/rivers/9/82/198.json";
    NSData * data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:url] ];
    NSString * str = [[[NSString alloc] initWithData:data
                                            encoding:NSUTF8StringEncoding] autorelease];
    GeoJSONFeatureCollection * fc =[strJson toGeoJSONFeatureCollection];
    GeoJSONFeatureCollection * fc2 =[str toGeoJSONFeatureCollection];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
