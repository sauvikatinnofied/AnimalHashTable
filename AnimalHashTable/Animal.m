//
//  Animal.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 16/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "Animal.h"

@implementation Animal


-(id)init
{
    if(self=[super init])
    {
        [self setDOB:nil];
        [self setAge:nil];
    }
    return self;
}
-(void)setDOB:(NSString*)dobInput{

    
    dob=dobInput;
    [self setAge:dobInput];
    
}


-(void)setAge:(NSString*)inputDOB{
    age=[self calculateAge:inputDOB];
}

//==================defining getters==================

-(NSString*)dob{
    return dob;
}
-(int)age{
    return age;
}




//============caculating age from NSString dob=============
//========class function===========
-(int)calculateAge:(NSString*)dateOfBirth{
    
    //NSLog(@"\n\nCalculating Age\n\n");
    
    
    //It will be  yyyy/mm/dd format
    //dateOfBirth=@"1989/12/12";
    // append the time with the dateOfBirth for compare
    dateOfBirth = [ dateOfBirth stringByAppendingString:@" 00:00:00 +0000"];
    
    
    
    // define NSDate from string
    NSDate *ptrDateOfBirth = [NSDate dateWithString:dateOfBirth];
    //NSLog(@" dateOfBirth in full form is %@",ptrDateOfBirth);
    // define NSDate Object with current time and date
    NSDate *ptrCurrentDate = [NSDate date];
    
    
    // find out the time interval between two date in seconds
    NSTimeInterval secondsBetween = [ptrCurrentDate timeIntervalSinceDate:ptrDateOfBirth];
    
    // calculate age by dividing second with total daytime in
    //second and followed by noof days in a year.

    int numberOfDays = secondsBetween / 86400;
    int animalAge = numberOfDays/365;
    
    // return age
    return animalAge;
    
}

//=========defining display to show the details of an animal============

-(void)display{
   
    printf("[Animal:age=%i ]",[self age]);
}

@end
