//
//  AnimalNode.h
//  AnimalHashTable
//
//  Created by Sandip Saha on 17/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface AnimalNode : NSObject
{
    @public
    Animal     *animal;
    AnimalNode *nextAnimalNode;
}

-(void)displayNode;
@end
