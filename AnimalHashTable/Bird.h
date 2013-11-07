//
//  Bird.h
//  AnimalHashTable
//
//  Created by Sandip Saha on 19/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "Animal.h"

@interface Bird : Animal
{
    @public
    int wings;
}

-(void)setWings:(int)inputWings;
-(int)wings;


@end
