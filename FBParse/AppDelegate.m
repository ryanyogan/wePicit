//
//  AppDelegate.m
//  FBParse
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Register our parse application
    [Parse setApplicationId:@"drJsObqKnT9Lko9P0pAb1XnMxJY0LrTzwp6dJZE9"
                  clientKey:@"twwG8rrjuVogFetHQQKV7MH0GI9HdrnR0zP91pgA"];
    
    // Initialize parse's facebook utils as singleton.  This uses the facebook app id
    [PFFacebookUtils initializeFacebook];
	return YES;
}

- (BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [PFFacebookUtils handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}
@end
