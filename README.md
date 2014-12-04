

## About KinveySignIn

This project is an update to the [Kinvey Sign-In project](https://github.com/KinveyApps/KinveyWidgets/tree/master/KinveyWidgets/Sign-In)

### Podspec

The original Kinvey Sign-In project did not support CocoaPods.   This project provides a functional Podspec which includes the necessary dependencies on the Kinvey and Facebook SDKs.

### Fixes for warnings

Several warnings have been fixed and the project has been updated for iOS 8:

- sizeWithFont:constrainedToSize:lineBreakMode: has been deprecated.  Replaced by boundingRectWithSize:options:attributes:context:

- KWSignInViewController.m, showModally had an incorrect assignment to nav.modalTransitionStyle


Analyze also found a couple issues that were fixed:

- Cases of [super viewWillAppear:animated] missing in a few controllers.

- Case of [super viewWillDisappear:animated] missing in a controller.


Some warnings remain, but these are restricted to the Facebook SDK.


### Bug Fixes

In landscape orientation, the Sign In button was not visible when social logins (Facebook, Twitter) were disabled.

The problem was in the layoutLandscape method of KWSignInViewController.m.   An array count (NSUInteger) of zero was decremented which resulted in an incorrect value when cast to a CGFloat.   The fix was to cast the count to NSInteger before decrementing.  


### Layout fixes

The status bar overlaps the content as of iOS 7 and this was affecting the placement of text, labels, etc. in some of the controllers associated with KWSignInViewController.  Fixes have been made to KWResetPasswordController.m, KWResendEmailVerificationController.m.




## Using KinveySignIn

The easiest way to include KinveySignIn in your project is to add it to an existing Podfile.

Example:

```
platform :ios, '8.1'

source 'https://github.com/CocoaPods/Specs.git'

pod 'KinveySignIn', :git => 'https://github.com/scottcarter/KinveySignIn.git'
```

### Documentation

Please refer to the original [Kinvey Sign-In project](https://github.com/KinveyApps/KinveyWidgets/tree/master/KinveyWidgets/Sign-In) for usage information.



## Demo

### Overview

The included demo allows one to test sign-in and logout.

You can control whether e-mail verification is used with the constant UseEmailVerification in Project.m.


### NavigationController

This is a subclass of UINavigationController and is the initial view controller.

This controller checks for an active user and whether e-mail verification is enabled and satisfied.  Note that it is necessary to refresh the KCSUser object from the Kinvey backend when e-mail verification is used.

Depending upong the current state, either the SignInViewController or MainViewController is pushed to the top of the navigation stack.

### LaunchViewController

This controller is used to mimic the launch screen (LaunchScreen.xib) and be presented as the initial view controller (via relation segue) for the NavigationController.  It is displayed briefly when transitioning to either the SignInViewController or MainViewController.  

It is possible to leave out this view controller and connect the SignInViewController directly to the NavigationController. In that case however the SignInViewController will be visible briefly even when the user is logged in and being sent to the MainViewController.


### Installation

#### Pods
Navigate to the folder where you downloaded the project (Ex: KinveySignIn-master/KinveySignInDemo) and execute

**pod install**

Assumes that CocoaPods is installed on your system.


#### Workspace based

When opening the project, be sure to select **KinveySignInDemo.xcworkspace**.


#### Kinvey setup

Create a new Kinvey App to accompany this project.  Within the app, navigate to the Dashboard and note the App ID and App Secret. 

Edit AppDelegate.m.  Within application:didFinishLaunchingWithOptions: look for initializeKinveyServiceForAppKey:withAppSecret:usingOptions: and insert your own App Key (App ID) and App Secret.








