//
//  HashTable.h
//  AnimalHashTable
//
//  Created by Sandip Saha on 19/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HashBucket.h"

@interface HashTable : NSObject
{
    @public
    HashTable *hashAddress;
    HashBucket *firstHashBucket;
    int numberOfIndexes;
    
}
-(id)searchBucketWithIndex:(int)inputIndex;
-(void)insertAnimal:(id)inputAnimal;
-(id)deleteAnimal:(NSString*)inputDateOfBirth;
-(id)searchAnimal:(NSString*)inputDateOfBirth;
-(void)display;

@end
