//
//  BlockTester.m
//  DetectBlockLeak101
//
//  Created by MaxwellMaxwell on 5/29/18.
//  Copyright © 2018 MaxwellMaxwell. All rights reserved.
/*returnType (^ blockName) (parameters)*/

#import "BlockTester.h"
@interface BlockTester()
//declaring a property that returns nothing, and passes in 3 parameters
@property(nonatomic, copy) void (^blockProperty)(id, NSUInteger, BOOL*);

@end

@implementation BlockTester
- (void)runTest{
    //declaring the method that will store the passed in block as a property
   
//calling the block that uses the block property
    [self doSomethingWithBlockProperty:^{
        NSLog(@"when you call self withing the calling method...\n");
        [self findPrimeNumbers];

    }];
//declaring the method that will store the passed in block as a property

}
-(void)doSomethingWithBlockProperty: (void (^)(void))callBack{
    NSLog(@"\nperform some calculations in the main body\nOnce this method completes, it invokes the callBack\n");

    callBack();
}

-(void)findPrimeNumbers{
    NSLog(@"Sieve of Eratosthenes algorithm calculates the list of prime numbers\n");
    int uptoNprimeNumbers, i, j, lineSkip;

    uptoNprimeNumbers = 0;
    lineSkip = 0;
    
    printf("Hello, Professor!\nThis program finds prime numbers using the Sieve of Eratosthenes algorithm\n");
    printf("\n\nPlease enter the number of prime numbers you want to find that starts from 1 to N: \n");
    uptoNprimeNumbers = 15;
    int a[uptoNprimeNumbers + 1];//declaring the array at run-time
    
    for (i=2; i<= uptoNprimeNumbers/2; i++)
    {
        for (j=2; j<= uptoNprimeNumbers/i; j++) {
            a[i*j]=0;//init all values of the array to zero (0).
        }
        for (i=1; i<uptoNprimeNumbers; i++)
        {
            if (a[i])
            {
                printf("%4d",i);
                lineSkip++;
                if (lineSkip % 10 == 0)
                {
                    printf("\n");
                }
                
            }
        }
    }
    printf("\n\n");
    
}
-(void)dealloc{
    NSLog(@"\nMemory was deallocated\n");
}

@end
