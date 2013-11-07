//
//  Animal.h
//  AnimalHashTable
//
//  Created by Sandip Saha on 16/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject{
    @public
    int age;
    NSString* dob;
    
}
 
//calculates age from NSString dob  
-(int)calculateAge:(NSString*) dob;

//declaring setters
-(void) setAge:(NSString*)inputDOB;
-(void) setDOB:(NSString*)inputDOB;

//declaring getters

-(int)age;
-(NSString*) dob;

//method to display the details of an animal

-(void)display;

@end//Animal class
