//
//  Reptile.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 19/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "Reptile.h"

@implementation Reptile
-(void)display
{
    printf("[Reptile age:%i  tails:%i]",age,tails);
}
-(void)setTails:(int)inputTails
{
    tails=inputTails;
}

-(int)tails
{
    return tails;
}
@end
