//
//  HashTable.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 19/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "HashTable.h"


@implementation HashTable

-(id)init
{
    NSDate *startTime=[NSDate date];

    if(self=[super init])
    {
                 hashAddress=nil;
        firstHashBucket=nil;
        numberOfIndexes=10;
        printf("\n==============INITIALIZING HASH TABLE ====================");
        printf("\nNumber of index::%i",numberOfIndexes);
        
        //initialising the very first  hash bucket
        HashBucket *bucket=[[HashBucket alloc]init];
        bucket->hashIndex=0;
                
        //saving the first bucket address
        firstHashBucket=bucket;
        
        
        for(int i=1;i<numberOfIndexes;i++)//creating the last buckets
        {
            
            HashBucket *newBucket=[[HashBucket alloc]init];
            newBucket->hashIndex=i;
            bucket->nextBucket=newBucket;
            bucket=newBucket;

        }
        
    }
    
    
    NSDate *endTime=[NSDate date];
    NSTimeInterval secondsBetween=[endTime timeIntervalSinceDate:startTime];
    double timeInterval=secondsBetween;
    
    printf("\nInitialization Operation completed in %lf  seconds...\n",timeInterval);
    
    printf("\n==============HASH TABLE INITIALIZATION COMPLETED===============\n\n");
    return self;
}
-(void)insertAnimal:(id)inputAnimal
{
     NSDate *startTime=[NSDate date];
    
    
    printf("\n==============HASH TABLE:ANIMAL INSERTION ===============\n\n");
    printf("Insertion in progress....");
    int ageIndex=[inputAnimal age]%numberOfIndexes;
    //traversing through the HashTable begining from Hash Address
    HashBucket *bucket=self->firstHashBucket;
    
    while(bucket->hashIndex!=ageIndex)
    {
        bucket=bucket->nextBucket;
    }
    
    //add the animal to the Animal List of the bucket
    
    if(bucket->animalList)//bucket has already a AnimalList
    {
        printf("\n\nIndex %i Reports:",bucket->hashIndex);
        [bucket->animalList addAnimal:inputAnimal];
    }
    else//allocate a new AnimalList
    {
        AnimalsInLinkedList *animalList=[[AnimalsInLinkedList alloc]init];
        bucket->animalList=animalList;
        printf("\n\nIndex %i Reports:",bucket->hashIndex);
        [animalList addAnimal:inputAnimal];
        
    }
   
    NSDate *endTime=[NSDate date];
    NSTimeInterval secondsBetween=[endTime timeIntervalSinceDate:startTime];
    double timeInterval=secondsBetween;
    
    printf("\n \nInsertion Operation completed in %lf  seconds...\n",timeInterval);
    
    
    printf("\n==============HASH TABLE:ANIMAL INSERTION COMPLETED===============\n\n");

    
}
-(id)deleteAnimal:(NSString*)inputDateOfBirth
{
    
    NSDate *startTime=[NSDate date];
    
    printf("\n\n===============Deletion starts=========================\n");
    Animal *animal=[[Animal alloc]init];
    int animalAge=[animal calculateAge:inputDateOfBirth];
    
    printf("\nAge of animal to delete:%i\n",animalAge);
    int hashIndex=animalAge%numberOfIndexes;
    printf("\nIndex %i Reports:",hashIndex);
    HashBucket *bucket=[ self searchBucketWithIndex:hashIndex];
    
    AnimalsInLinkedList *animalList=bucket->animalList;
    animal=[animalList deleteAnimal:inputDateOfBirth];//rewriting animal 
    
    if(animal)
    {
        printf("\n\nHash Table Reports:\nDeletion Successful Form index:%i ",hashIndex);
        printf("\nDeleted Animal::");
        [animal display];
        printf("\n");
        
    }
    else
    {
        printf("\nDeletion Unsuccessful from the hash table\n");
    
    }
    
    
    NSDate *endTime=[NSDate date];
    NSTimeInterval secondsBetween=[endTime timeIntervalSinceDate:startTime];
    double timeInterval=secondsBetween;
    
    printf("\n\nDeletion Operation completed in %lf  seconds...\n",timeInterval);
    
    
    printf("\n==================Hash Table Deletion Completed ================\n");
    
    printf("\nModified HashTable after deletion");
    [self display];
    
    
    return animal;
    
}
-(id)searchAnimal:(NSString*)inputDateOfBirth
{
    NSDate *startTime=[NSDate date];
    
    printf("\n==============Hash Table Searching In Progress ===============\n");
    Animal *animal=[[Animal alloc]init];
    int animalAge=[animal calculateAge:inputDateOfBirth];
    
    int hashIndex=animalAge%numberOfIndexes;
    printf("\nIndex %i Reports:\n",hashIndex);
    
    HashBucket *bucket=[ self searchBucketWithIndex:hashIndex];
    
    AnimalsInLinkedList *animalList=bucket->animalList;
    
    animal=[animalList searchAnimal:inputDateOfBirth];//rewriting animal
    
    if(animal)
    {
        printf("\nHash Table:Searching Successful \n");
        printf("Found Animal::");
        [animal display];
        printf(" from index:%i",hashIndex);
        printf("\n");
    }
    
    else
    {
        printf("\nSearching Unsuccessful on the hash table ...");
    }
    
    
    NSDate *endTime=[NSDate date];
    NSTimeInterval secondsBetween=[endTime timeIntervalSinceDate:startTime];
    double timeInterval=secondsBetween;
    
    printf("\n\nSearching  Operation completed in %lf  seconds...\n",timeInterval);
    
    printf("\n==================Hash Table Searching Completed =================\n");
    return animal;
    
}
-(void)display
{
    NSDate *startTime=[NSDate date];
    
    HashBucket *firstBucket=self->firstHashBucket;
    printf("\n\n=================Hash Table Details==================\n");
    //if first has etries show its animal list
     NSLog(@"\n\n%@",self->hashAddress);
    if(firstBucket->animalList!=nil)
    {
        printf("|\n%i->",firstBucket->hashIndex);
        [firstBucket->animalList display];
    }
    
    HashBucket *nextBucket=firstBucket->nextBucket;
    while(nextBucket)
    {
        if(nextBucket->animalList!=nil)
        printf("\n|\n%i->",nextBucket->hashIndex);
        [nextBucket->animalList display];
        nextBucket=nextBucket->nextBucket;
    }

    
    NSDate *endTime=[NSDate date];
    NSTimeInterval secondsBetween=[endTime timeIntervalSinceDate:startTime];
    double timeInterval=secondsBetween;
    
    printf("\n\nDisplay Operation completed in %lf  seconds...\n",timeInterval);
    
    printf("\n\n==========Hash Table Details  Ends===========\n");

}

-(id)searchBucketWithIndex:(int)inputIndex
{
    HashBucket* bucket=self->firstHashBucket;
    
    //starting traversing from the very first bucket
    BOOL found=FALSE;
    
    while(!found)
    {
        if(bucket->hashIndex==inputIndex)
        {
            return bucket;
            
        }
        else
        {
            bucket=bucket->nextBucket;
        }
    }
    if(!found)
      return nil;//retunrs nil if bucket not found
    return bucket;
}

@end
