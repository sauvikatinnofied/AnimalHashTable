//
//  AnimalNode.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 17/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "AnimalNode.h"

@implementation AnimalNode

-(id)init
{
    if(self=[super init]){
        animal=nil;
        nextAnimalNode=nil;
    }
    return self;
}



-(void)displayNode{
    
    [animal display];
    
    if(self->nextAnimalNode!=nil)
        printf("->");
}

@end
