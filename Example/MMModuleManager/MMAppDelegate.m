//
//  MMAppDelegate.m
//  MMModuleManager
//
//  Created by Mosquito1123 on 05/21/2019.
//  Copyright (c) 2019 Mosquito1123. All rights reserved.
//

#import "MMAppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import <MMModuleManager/FRDModuleManager.h>
@implementation MMAppDelegate
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions

{
    // Override point for customization after application launch.
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"Modules" ofType:@"plist"];
    
    FRDModuleManager *manager = [FRDModuleManager sharedInstance];
    [manager loadModulesWithPlistFile:plistPath];
    
    [manager application:application willFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[FRDModuleManager sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    [[FRDModuleManager sharedInstance] applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[FRDModuleManager sharedInstance] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[FRDModuleManager sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[FRDModuleManager sharedInstance] applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[FRDModuleManager sharedInstance] applicationWillTerminate:application];
}

#pragma mark - Handling Remote Notification

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[FRDModuleManager sharedInstance] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[FRDModuleManager sharedInstance] application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    [[FRDModuleManager sharedInstance] application:application
                      didReceiveRemoteNotification:userInfo
                            fetchCompletionHandler:completionHandler];
    
}

#pragma mark - Handling Local Notification

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    [[FRDModuleManager sharedInstance] userNotificationCenter:center
                                      willPresentNotification:notification
                                        withCompletionHandler:completionHandler];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler
{
    [[FRDModuleManager sharedInstance] userNotificationCenter:center
                               didReceiveNotificationResponse:response
                                        withCompletionHandler:completionHandler];
}

@end
