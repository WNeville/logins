//
//  main.m
//  Logins
//
//  Created by William Neville on 2/10/14.
//  Copyright (c) 2014 William Neville. All rights reserved.
//
//  A naïve implementation of a login keeper, the stores usernames and passwords
//  to various web services. Each login is kept in a dictionary. It is naïve in
//  the sense that none of this data is ever written to an external file, nor is
//  any of the information encrypted.

#import <Foundation/Foundation.h>
#import "SiteValue.h"


int main(int argc, const char * argv[])
{
  @autoreleasepool {
    
    //Hard coding some entries for the login dictionary
    [SiteValue addToDictionaryWithKey:@"gmail"
                          andUsername:@"wneville"
                          andPassword:@"gengar242"];
    [SiteValue addToDictionaryWithKey:@"twitter"
                          andUsername:@"wvnix"
                          andPassword:@"luv2tweet"];
    [SiteValue addToDictionaryWithKey:@"aim"
                          andUsername:@"xXhAcKeRXx"
                          andPassword:@"longlivethenineties"];
    [SiteValue addToDictionaryWithKey:@"tumblr"
                          andUsername:@"trueHipster"
                          andPassword:@"iusebsd"];
    
    //Copying the static login pointer shared by SiteValues to a local pointer,
    //simply to make the following code a bit cleaner.
    //
    //Another way to have approached this is to have the dictionary not at all
    //associated with the SiteValue class, and have it only exist in main.m.
    NSMutableDictionary *login = [SiteValue login];
    
    //Printing out the current state of the login dictionary
    NSLog(@"Before deletions:");
    [SiteValue printDictionary];
    
    //Removing some entries
    [login removeObjectForKey:@"tumblr"];
    [login removeObjectForKey:@"aim"];
    
    NSLog(@"After deletions:");
    [SiteValue printDictionary];
    
    //Updating count for each entry in the dictionary
    for(NSString *key in login) {
      [[login objectForKey:key] increaseCount];
    }
    
    //Increasing count for twitter a lot, to mirror most people
    for(int i = 0; i < 5; i++) {
      [[login objectForKey:@"twitter"] increaseCount];
    }
    
    NSLog(@"After increasing counts:");
    [SiteValue printDictionary];
    
    //Trying to add an account with a duplicate username
    [SiteValue addToDictionaryWithKey:@"hotmail"
                          andUsername:@"wneville"
                          andPassword:@"yeahwindowswooo"];
    
    NSLog(@"After failed duplicate username insertion:");
    [SiteValue printDictionary];
  }
    
  return 0;
}

