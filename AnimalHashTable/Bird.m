//
//  Bird.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 19/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "Bird.h"

@implementation Bird

-(void)setWings:(int)inputWings
{
    wings=inputWings;
}
-(int)wings
{
    return wings;
}
-(void)display
{
    printf("[Bird age:%i  wings:%i]",age,wings);
    
}

@end
