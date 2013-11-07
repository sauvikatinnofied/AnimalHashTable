//
//  HashBucket.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 19/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "HashBucket.h"

@implementation HashBucket
-(id)init
{
    if(self=[super init])
    {
        hashIndex=-1;
        nextBucket=nil;
        animalList=nil;
    }
    
   return self;
}
@end
