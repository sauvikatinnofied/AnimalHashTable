//
//  AnimalsInLinkedList.m
//  AnimalHashTable
//
//  Created by Sandip Saha on 17/07/13.
//  Copyright (c) 2013 Sandip Saha. All rights reserved.
//

#import "AnimalsInLinkedList.h"
#import "AnimalNode.h"

@implementation AnimalsInLinkedList

-(id)init
{
    if(self=[super init])
    {
       nodeAtVeryFast=nil;
    }
    return self;
}


//=======================ANIMAL IINSERTIONS IN THE LIST==============================
-(void)addAnimal:(Animal*)inputAnimal
{
    //implemnt the searching procedure to find out the proper place to add the animal
    //0.create a AnimalNode first and insert the incoming Animal Object
    //1.inserting as the very first node
    //2.inserting in between two existing nodes
    //3.inserting at the very end
    
    //0
    AnimalNode *newAnimalNode=[[AnimalNode alloc]init];
    newAnimalNode->animal=inputAnimal;
    //newAnimalNode->nextAnimalNode=nil;
    
    AnimalNode *traversingNode=self->nodeAtVeryFast;
    
    printf("\nGoing to insert::");
    [inputAnimal display];
    printf("\n");
    
    
    if(traversingNode)
    {
        printf("\nNode exists...");
        
        if((traversingNode->animal).age >inputAnimal.age)//entry will be at the begining
        {
            newAnimalNode->nextAnimalNode=nodeAtVeryFast;
            nodeAtVeryFast=newAnimalNode;
            printf("\nEnrty at the very begining done...");
        }
        else//entry will be inbetween two or at last
        {
            printf("\nGoing to insert in between two animal nodes...\n");
            
            AnimalNode *prevoius=nodeAtVeryFast;//previous node creating the problem because of nextNode of it
           
            int countNode=1;
            BOOL moreNode=TRUE;
            
            while(moreNode && (traversingNode->animal.age <= inputAnimal.age) )
                  
            {
                
                printf("\nVisited Node:%i. Moving to next node...",countNode);
                countNode++;
                                
                if(traversingNode->nextAnimalNode !=nil)
                {
                   prevoius=traversingNode;
                   traversingNode=traversingNode->nextAnimalNode;
                }
                else
                {
                    moreNode=FALSE;
                }
                
            }
            
            
            
            if(moreNode)//entry will be in between two
            {
                newAnimalNode->nextAnimalNode=traversingNode;
                //[prevoius displayNode];
                prevoius->nextAnimalNode=newAnimalNode;
                printf("\nInbetween addition completed...");
                
            }
            else//entry will be at very last
            {
                traversingNode->nextAnimalNode=newAnimalNode;
                printf("\nNode at last position added...");
            }
            
        }
           
        
    }
    else//this will be the first entry of the list
    {
        nodeAtVeryFast=newAnimalNode;
        printf("\nInserting for the first time done... ");
    }
    
    
}

//=======================ANIMAL IINSERTIONS IN THE LIST  ENDS==================



//=======================ANIMAL LIST DISPLAY==================================

-(void)display
{
    //1.chech that node at very first is not nil
    //2.Traverse through the animal nodes
    //3.call display methods of those AnimalNodes
    
    if(self->nodeAtVeryFast!=nil)//list has at least one entry
    {
        //printf("\n\n==========Animal Linked List Details===========\n");

        //1.create a animal node pointing to the very first node
        AnimalNode *animalNode=nodeAtVeryFast;
        [animalNode displayNode];//displays the very first node
        
        //strating traverisng
        while(animalNode->nextAnimalNode!=nil)
        {
            animalNode=animalNode->nextAnimalNode;
            [animalNode displayNode];
        }
        //printf("\n==========Animal Linked List Details Ends===========\n");
        
    }//end of if
    else//if the linked list empty
    {
        printf("\nAnimal Linked List Is Empty");
    }
}
//=======================ANIMAL LIST DISPLAY  ENDS========================





//=======================ANIMAL DELETION FROM  LIST========================
-(id)deleteAnimal:(NSString*)inputDateOfBirth
{
    id deletedAnimal=nil;
    
        
    if(self->nodeAtVeryFast)//atleast has an animalNode
    {
        AnimalNode *firstNode=self->nodeAtVeryFast;
        
        //testing whether the first node is to be deleted or not
        
        if((firstNode->animal).dob==inputDateOfBirth)
        {
            deletedAnimal=firstNode->animal;
            printf("\nFirst node of AnimalList matches,Going to delete...");
            self->nodeAtVeryFast=firstNode->nextAnimalNode;
            
            printf("\nVery first node deleted::Deleted Animal::");
            [deletedAnimal display] ;printf("...\n");
        }
        
        else//Animal might be found in between nodes or at the last node
        {
            printf("\nAnimal might be found in between nodes or at the last node...\n");
            
            AnimalNode *traversingNode=self->nodeAtVeryFast;
            AnimalNode *prevoius=traversingNode;
            
            BOOL found=FALSE;
            BOOL moreNode=TRUE;
            
            int nodeCount=1;
            while(!found  && moreNode)
            {
                
                if((traversingNode->animal)->dob==inputDateOfBirth)
                {
                    found=TRUE;
                    printf("\nMatch found at node number=%i to delete...\n ",nodeCount);
                    deletedAnimal=traversingNode->animal;
                    
                }
                else
                {
                    
                    prevoius=traversingNode;
                    printf("\nVisited Node:%i ,Moving to next AnimalNode...",nodeCount);
                    nodeCount++;
                    traversingNode=traversingNode->nextAnimalNode;
                    
                    if(traversingNode==nil)//have reached at the end of the list
                        moreNode=FALSE;
                    
                }
            }
            
            if(found && traversingNode->nextAnimalNode)//animal has been found in between two nodes
            {
                printf("\nAnimal has been found in between two nodes::");
                [deletedAnimal display];printf("...\n");
                
                prevoius->nextAnimalNode=traversingNode->nextAnimalNode;
                printf("\nInbetween deletion successful\n");
                
            }
            else if(found && (traversingNode->nextAnimalNode==nil))//found at very last node
            {
                                
                deletedAnimal=traversingNode->animal;
                prevoius->nextAnimalNode=nil;
                
                printf("\nDeletion successful at very last node::Deleted::");
                [deletedAnimal display];printf("...\n");
                
                
            }
            else
            {
                printf("\nTraversing Completed ,match not found...\n");

                
            }
        }
        
    }
    else
    {
        printf("\nDeletinon List is empty,deletion unsuccessful...\n");
        
    }
    
    return  deletedAnimal;
}
//=======================ANIMAL DELETION FROM  LIST  ENDS========================

//=======================ANIMAL SEARCH FROM  LIST ========================
-(id)searchAnimal:(NSString*)inputDateOfBirth
{
    id searchedAnimal=nil;
    
    if(self->nodeAtVeryFast)//if list is not empty
    {
        printf("\nAnimal List found ::Searching in progress.....please wait\n");
        
        AnimalNode *traversingNode=self->nodeAtVeryFast;
        BOOL found=FALSE;
        BOOL moreNode=TRUE;
        int nodeCounter=1;
        while(!found && moreNode)
        {
            if((traversingNode->animal)->dob ==inputDateOfBirth)
            {
                printf("\nSearching Successful::Match Found at Animal Node Number:%i",nodeCounter);
                searchedAnimal=traversingNode->animal;
                [searchedAnimal display];printf("\n");
                found=TRUE;
            }
            else
            {
                nodeCounter++;
                printf("\nMoving to  node number:%i....\n",nodeCounter);
                traversingNode=traversingNode->nextAnimalNode;
                
                
                if(traversingNode==nil)
                    moreNode=FALSE;
            }
        }//end of while
        
        
        if(found)
        {
            printf("\nReturning matched animal...\n");
        }
        else
        {
            printf("\nAnimal list traversing completed ,MATCH NOT FOUND...\n");
        }
        
        
    }
    else
    {
        printf("\nList was empty ,searched completed...\n");
    }
        
    
    
    
    return searchedAnimal;
    
}

//=======================ANIMAL SEARCH FROM  LIST ENDS ========================



@end
