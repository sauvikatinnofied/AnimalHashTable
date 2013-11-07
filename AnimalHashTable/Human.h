//
//  Human.h
//  AnimalHashTable
//
//  Created by Sandip Saha on 17/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "Animal.h"

@interface Human : Animal{
    @public
    int leg;
}

-(void)setLeg:(int)input;
-(int)leg;
-(void)display;

@end
