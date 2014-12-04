//
//  SignInViewController.m
//  KinveySignInDemo
//
//  Created by Scott Carter on 11/25/14.
//  Copyright (c) 2014 Scott Carter. All rights reserved.
//

#import "SignInViewController.h"

#import "Project.h"


#import "KWSignInViewController.h"
#import "KCSSignInDelegate.h"


#pragma mark -


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//                    Private Interface
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
@interface SignInViewController () <KCSSignInResponder>

// ==========================================================================
// Properties
// ==========================================================================
//
#pragma mark -
#pragma mark Properties

// None

@end



// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//                    Implementation
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
#pragma mark -
@implementation SignInViewController

// ==========================================================================
// Constants and Defines
// ==========================================================================
//
#pragma mark -
#pragma mark Constants and Defines

// None




// ==========================================================================
// Getters and Setters
// ==========================================================================
//
#pragma mark -
#pragma mark Getters and Setters

// None


// ==========================================================================
// Actions
// ==========================================================================
//
#pragma mark -
#pragma mark Actions


- (IBAction)signInAction:(UIButton *)sender {
    
    [self signIn];
    
}



// ==========================================================================
// Initializations
// ==========================================================================
//
#pragma mark -
#pragma mark Initializations




- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"SignInViewController viewDidLoad");
    
   
}





// ==========================================================================
// Protocol methods
// ==========================================================================
//
#pragma mark -
#pragma mark Protocol methods

#pragma mark KCSSignInResponder

- (void) userSucessfullySignedIn:(KCSUser*)user
{
    NSLog(@"User successfully signed in: %@", user);
    
    [self dismissViewControllerAnimated:YES completion:^{
        [self performSegueWithIdentifier:@"SignedInSegue" sender:self];
    }];
}


// ==========================================================================
// Class methods
// ==========================================================================
//
#pragma mark -
#pragma mark Class methods

// None


// ==========================================================================
// Instance methods
// ==========================================================================
//
#pragma mark -
#pragma mark Instance methods


// Show the sign in view controller
- (void)signIn
{
    KWSignInViewController* signInViewController = [[KWSignInViewController alloc] init];
    
    // Create an instance of KCSSignInDelegate to handle the protocol methods for KWSignInViewControllerDelegate
    // which KWSignInViewController uses.
    KCSSignInDelegate* signInDelegate = [[KCSSignInDelegate alloc] init];
    signInDelegate.signInResponder = self;
    
    
    if(UseEmailVerification){
        signInDelegate.emailVerificationRequired = YES;
        signInDelegate.shouldSendEmailVerificationAfterSignup = YES;
    }
    
    
    signInViewController.signInDelegate = signInDelegate;
    
    // Not currently enabling social logins (Facebook, Twitter)
    signInViewController.socialLogins = @[];
    
    // Show the sign in view controller.
    [signInViewController showModally];

}






// ==========================================================================
// C methods
// ==========================================================================
//


#pragma mark -
#pragma mark C methods





@end












