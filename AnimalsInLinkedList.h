//
//  AnimalsInLinkedList.h
//  AnimalHashTable
//
//  Created by Sandip Saha on 17/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//
//  contains animals in a linked list(Implementing following the basic way)
//  
//  will have
//  =========
//  1.addAnimal:(Animal*)inputAnimal
//  2.-(Animal*)deleteAnimal:(NSString*)inputDateOfBirth  ----returns the deleted animal
//  3.-(Animal*)searchAnimal:(int)age  ----returns the searched animal
//

#import <Foundation/Foundation.h>
#import "AnimalNode.h"
#import "Human.h"
#import "Reptile.h"
#import "Bird.h"

@interface AnimalsInLinkedList : NSObject
{
    AnimalNode *nodeAtVeryFast;
        
}


-(void)addAnimal:(Animal*)inputAnimal;
-(id)deleteAnimal:(NSString*)inputDateOfBirth;
-(id)searchAnimal:(NSString*)inputDateOfBirth;
-(void)display;



@end
