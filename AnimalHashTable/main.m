//
//  main.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 16/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "AnimalNode.h"
#import "HashTable.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        
        HashTable *hashTable=[[HashTable alloc]init];
        hashTable->hashAddress=hashTable;
        

        
        //Date of birth format yyyy/mm/dd
        
        Animal *myAnimal=[[Animal alloc]init];
        [myAnimal setDOB:@"1989/12/12"];
        [hashTable insertAnimal:myAnimal];
        
        
        Human *human=[[Human alloc]init];
        [human setDOB:@"1992/09/23"];
        [human setLeg:2];
        [hashTable insertAnimal:human];
        

        
        Human *human2=[[Human alloc]init];
        [human2 setDOB:@"1994/02/02"];
        [human2 setLeg:2];
        [hashTable insertAnimal:human2];
        
        
        
        Human *human3=[[Human alloc]init];
        [human3 setDOB:@"1985/02/03"];
        [human3 setLeg:2];
        [hashTable insertAnimal:human3];
        
        
        Human *human5=[[Human alloc]init];
        [human5 setDOB:@"1990/12/03"];
        [human5 setLeg:2];
        [hashTable insertAnimal:human5];

        Reptile *reptile=[[Reptile alloc]init];
        [reptile setDOB:@"2000/02/03"];
        [reptile setTails:2];
        [hashTable insertAnimal:reptile];
        
        Bird *bird=[[Bird alloc]init];
        [bird setDOB:@"1983/12/12"];
        [bird setWings:2];
        [hashTable insertAnimal:bird];
        
        Reptile *reptile1=[[Reptile alloc]init];
        [reptile1 setDOB:@"2010/02/03"];
        [reptile1 setTails:2];
        [hashTable insertAnimal:reptile1];
        
        Reptile *reptile2=[[Reptile alloc]init];
        [reptile2 setDOB:@"1984/02/03"];
        [reptile2 setTails:1];
        [hashTable insertAnimal:reptile2];
        
        
        Bird *bird1=[[Bird alloc]init];
        [bird1 setDOB:@"1999/09/12"];
        [bird1 setWings:2];
        [hashTable insertAnimal:bird1];
        
        Bird *newBird=[[Bird alloc]init];
        [newBird setDOB:@"1994/02/23"];
        [newBird setWings:5];
        [hashTable insertAnimal:newBird];
        
        
        
        Bird *bird2=[[Bird alloc]init];
        [bird2 setDOB:@"1972/01/12"];
        [bird2 setWings:2];
        [hashTable insertAnimal:bird2];
        
        [hashTable display];
        
        
        
        //testing for an unsuccessful deletion
        [hashTable deleteAnimal:@"1983/01/12"];
        
        //testing for a successful deletion
        [ [hashTable deleteAnimal:@"2010/02/03"] display];
        
        //testing for a successful searching
        [hashTable searchAnimal:@"2000/02/03"];
        
        
        //testing for an unsuccessful searching
        [hashTable searchAnimal:@"2009/02/03"];
        
        
        
        
      
        
    }
    return 0;
}

