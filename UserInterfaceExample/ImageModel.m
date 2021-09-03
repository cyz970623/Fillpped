//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"



@implementation ImageModel{
    NSArray* _imageNames;
}

//NSArray* imageNames;
//NSArray* _imageNames;
//imageNames = _imageNames,
//@synthesize NSArray* imageNames;
@synthesize imageDictionary = _imageDictionary;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff"];
    NSLog(@"imageNames");
    
    return _imageNames;
}

-(NSDictionary*) imageDictionary{
    if(!_imageDictionary)
        _imageDictionary = @{@"Bill":[UIImage imageNamed:@"Bill"],@"Eric":[UIImage imageNamed:@"Eric"],@"Jeff":[UIImage imageNamed:@"Jeff"]};
    
    [_imageDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
         
         NSLog(@"%@ --> %@",key,obj);
         
     }];
    
    return _imageDictionary;
}


-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = nil;
    image = [_imageDictionary objectForKey:name];
    
    return image;
}


-(UIImage*)getImageWithIndex:(NSInteger)index{
    UIImage* image = nil;
    image = [_imageDictionary objectForKey:[_imageNames objectAtIndex:index]];
    return image;
}
-(NSInteger*)numberOfImages{
    NSInteger* imageNum = nil;
    imageNum = (NSInteger)_imageNames.count;
    
    return imageNum;
}
-(NSString*)getImageNameForIndex:(NSInteger)index{
    NSString* name = nil;
    name = [_imageNames objectAtIndex:index];
    NSLog(@"name is %@",name);
    return name;
}



@end
