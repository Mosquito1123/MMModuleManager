# MMModuleManager


[![Test Status](https://travis-ci.org/lincode/MMModuleManager.svg?branch=master)](https://travis-ci.org/lincode/MMModuleManager)
[![IDE](https://img.shields.io/badge/XCode-8-blue.svg)]()
[![iOS](https://img.shields.io/badge/iOS-7.0-blue.svg)]()
[![Language](https://img.shields.io/badge/language-ObjC-blue.svg)](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)

## 简介

**MMModuleManager** 是一个简单的 iOS 模块管理工具。如果你发现自己项目中实现了协议 UIApplicationDelegate 的 AppDelegate 变得越来越臃肿，你可能会需要这个小工具；如果你的项目实施了组件化或者模块化，你需要为各个模块在 UIApplicationDelegate 定义的各个方法内留下钩子(hook)，以便模块可以知晓整个应用的生命周期，你可能会需要这个小工具。

MMModuleManager 可以减小 AppDelegate 的代码量，把很多职责拆分至各个模块中去。这样 AppDelegate 会变得容易维护。

MMModuleManager 可以使得留在 AppDelegate 的钩子方法被统一管理。实现了协议 UIApplicationDelegate 的 AppDelegate 是我知晓应用生命周期的重要途径。如果，某个模块需要在应用启动时初始化，那么我们就需要在 AppDelegate 的
`application:didFinishLaunchingWithOptions:` 调用一个该模块的初始化方法。模块多了，调用的初始化方法也会增多。最后，AppDelegate 会越来越臃肿。MMModuleManager 提供了一个统一的接口，让各模块知晓应用的生命周期。在 AppDelegate 中留下钩子，在特定的生命周期调用模块的对应方法。这样将使得 AppDelegate 更简单。对于应用生命周期的使用也更清晰。




## 使用

你可以查看 Demo 中的例子。了解如何使用 MMModuleManager。Demo 给出了完善的示例。

### 加载所有模块

```Objective-C
NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"ModulesRegister" ofType:@"plist"];
FRDModuleManager *manager = [FRDModuleManager sharedInstance];
[manager loadModulesWithPlistFile:plistPath];
```

MMModuleManager 使用一个 plist 文件注册所有模块。你可以查看 Demo 中的 `ModulesRegister.plist` 文件查看注册模块的方法。该 plist 文件很简单，只有一个包含所有模块名的数组。

### 在 UIApplicationDelegate 各方法中留下钩子

```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"ModulesRegister" ofType:@"plist"];
FRDModuleManager *manager = [FRDModuleManager sharedInstance];
[manager loadModulesWithPlistFile:plistPath];

[manager application:application didFinishLaunchingWithOptions:launchOptions];

return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
[[FRDModuleManager sharedInstance] applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
[[FRDModuleManager sharedInstance] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
[[FRDModuleManager sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
[[FRDModuleManager sharedInstance] applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
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

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
[[FRDModuleManager sharedInstance] application:application
didReceiveLocalNotification:notification];
}

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

```

在 MMModuleManager 被 UIApplicationDelegate 各方法内留下的钩子调用时，会调用注册的每个模块的相同的方法。这样每个模块就都知晓了应用的生命周期。


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MMModuleManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MMModuleManager'
```

## Author

Mosquito1123, winston.zhangwentong@gmail.com

## License

MMModuleManager is available under the MIT license. See the LICENSE file for more info.
