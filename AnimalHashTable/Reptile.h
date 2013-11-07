//
//  Reptile.h
//  AnimalHashTable
//
//  Created by Sandip Saha on 19/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "Animal.h"

@interface Reptile : Animal
{
    int tails;
}
-(void)setTails:(int)inputTails;
-(int)tails;

@end
