//
//  HashBucket.h
//  AnimalHashTable
//
//  Created by Sandip Saha on 19/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "AnimalsInLinkedList.h"

@interface HashBucket :NSObject
{
    @public
    int hashIndex;
    HashBucket *nextBucket;
    AnimalsInLinkedList *animalList;
}

@end
