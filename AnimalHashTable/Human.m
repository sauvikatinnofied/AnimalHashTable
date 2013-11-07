//
//  Human.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 17/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "Human.h"

@implementation Human

-(id)init
{
    if(self=[super init])
    {
        [self setLeg:0];
        
    }
    return self;
}
-(void)setLeg:(int)input{
    leg=input;
    
}

-(int)leg{
    return leg;
}
-(void)display{
    printf("[Human:age=%i leg=%i]",age,leg);
}

@end
