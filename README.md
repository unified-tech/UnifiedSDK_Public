![UnifiedSDK](https://preview.ibb.co/gqEikK/Service_Simplified_transparent_1468px.png)

## Requirements

- iOS 10+.

- `UnifiedSDK` uses several core iOS frameworks which require specific privacy usage descriptions to be included in the host applications info.plist. If these are not included the application terminate.
	- NSLocationAlwaysAndWhenInUseUsageDescription
	- NSLocationAlwaysUsageDescription
	- NSLocationWhenInUseUsageDescription
	- NSMotionUsageDescription
	- NSCameraUsageDescription
	- NSPhotoLibraryUsageDescription

- For the `UnifiedSDK` to function correctly when the host application is in the background, we require the **'Location Updates' Background Mode** to be enabled. This can be found in the capabilities tab for your application target.


## Installation
### From CocoaPods
### Manually

## Usage
### Initialization

```objective-c
@import UnifiedSDK;
```

`UnifiedSDK` is accessed via its singleton (i.e. it doesn't need to be explicitly allocated and instantiated, and is accessed via `[UnifiedController sharedController]`).

 Before starting `UnifiedSDK` you will need to provide an **API Key** given to you via the Unified support team.
  
 ```objective-c
 [[UnifiedController sharedController] setApiKey:API_KEY];
 ```
 
 It is recommended to subscribe to the `UnifiedControllerDelegate` so that hardware and networking related errors can be displayed.
 
 ```objective-c
 - (void)unifiedControllerDidFailWithError:(NSError *)error;
 ```
  
### Creating Users

`UnifiedSDK` requires a Unified User to be created for the service to function. We don't provide user authentication and it is expected that when a user has been created, the userID is stored within the host applications user database so that it can be retrieved on future application launchs.

```objective-c
[[UnifiedController sharedController] createUserWithFirstName:firstName
                                                     lastName:lastName
                                                andCompletion:^(NSString *userID, NSError *error) {
                                                        
                                                }];
```
Once a userID has been created and stored, it then must be set (see below). 

It is recommended to provide the users first and last names if possible when using our Hospitality features for a better user experience but is not required.

### Setting the Current User

Before 'starting' the `UnifiedSDK` you must set the current user via the `UnifiedController`.

```objective-c
[[UnifiedController sharedController] setCurrentUserWithUserID:USER_ID
                                                 andCompletion:^(NSError *error) {
                                                                 
                                                 }];
```

### Starting Unified

To start calculating a users location you must call `-startUnified`. Once this has been called `UnifiedSDK` will run in the background and automatically upload location data to our servers. This must be called after an API key and userID has been set via the previous methods.

```objective-c
[[UnifiedController sharedController] startUnified];
```

### Stopping Unified

It is possible to stop calculating a users location via `-stopUnified`. This would usually be called when logging a user out from the host application. If you would like to start location updates again, it is advised to set the current user (see 'Setting the Current User') to ensure the userID is correct.

```objective-c
[[UnifiedController sharedController] stopUnified];
```

## License

## Credits
