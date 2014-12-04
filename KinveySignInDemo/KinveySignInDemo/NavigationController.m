//
//  NavigationController.m
//  KinveySignInDemo
//
//  Created by Scott Carter on 11/26/14.
//  Copyright (c) 2014 Scott Carter. All rights reserved.
//

#import "NavigationController.h"

#import "Project.h"

#import "SignInViewController.h"
#import "MainViewController.h"

@interface NavigationController ()

@end

@implementation NavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"NavigationController viewDidLoad");
    
    
    [KCSPing pingKinveyWithBlock:^(KCSPingResult *result) {
        if (result.pingWasSuccessful == YES){
            NSLog(@"Kinvey Ping Success with result %@",result);
        } else {
            NSLog(@"Kinvey Ping Failed with result %@",result);
        }
    }];
    
    
    // Determine whether to start with SignInViewController or MainViewController
    
    
    UIStoryboard *storyboard = self.storyboard;
    
    SignInViewController *signInViewController = (SignInViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SignInViewControllerId"];
    
    
    
    KCSUser *user = [KCSUser activeUser];
    
    // User active?
    if(user){
        
        // If we are not using email verification, we can immediately segue
        if(!UseEmailVerification){
            NSLog(@"E-mail verification not in use.  Push to main view controller.");
            MainViewController *mainViewController = (MainViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MainViewControllerId"];
            
            [self setViewControllers:@[signInViewController, mainViewController] animated:YES];
            return;
        }
        
        
        // If we are using email verification, see if we have been verified.
        //
        // First we need to get updated information from Kinvey.
        //
        [user refreshFromServer:^(NSArray *objectsOrNil, NSError *errorOrNil) {
            
            KCSUser *user = [KCSUser activeUser];  // Or [objectsOrNil firstObject]
            
            if(!user.emailVerified){
                NSLog(@"E-mail verification in use.  User not yet verified.  Push to sign in view controller.");
                [self setViewControllers:@[signInViewController] animated:YES];
            }
            else {
                NSLog(@"E-mail verification in use.  User has been verified.  Push to main view controller.");
                MainViewController *mainViewController = (MainViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MainViewControllerId"];
                
                [self setViewControllers:@[signInViewController, mainViewController] animated:YES];
            }
           
        }];
        
        
    }
    
    // User not active.
    else {
        NSLog(@"User not active.  Push to sign in view controller.");
        [self setViewControllers:@[signInViewController] animated:YES];
    }

    
    
}


@end
