//
//  AppDelegate.swift
//  CC98
//
//  Created by Orpine on 11/13/15.
//  Copyright © 2015 Orpine. All rights reserved.
//

import UIKit
import ReachabilitySwift
//import p2_OAuth2

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var reachability: Reachability?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        oauth.onAuthorize = { parameters in
            print("Did authorize with parameters: \(parameters)")
        }
        oauth.onFailure = { error in        // `error` is nil on cancel
            if nil != error {
                print("Authorization went wrong: \(error.debugDescription)")
            }
        }
        
        oauth.authConfig.authorizeEmbedded = true
        oauth.authConfig.ui.useSafariView = false

        do {
            reachability = try Reachability(hostname: "api.cc98.org")
            NSNotificationCenter.defaultCenter().addObserver(self,
                selector: "reachabilityChanged:",
                name: ReachabilityChangedNotification,
                object: reachability)
            do {
                try reachability!.startNotifier()
            } catch {
                print("Unable to start Notifier")
            }
        } catch {
            print("Unable to create Reachability")
        }
        
        
        return true
    }
    


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func reachabilityChanged(note: NSNotification) {
        
        let reachability = note.object as! Reachability
        print(reachability.currentReachabilityStatus.description)
        globalDataProcessor.SetNetworkStatus(reachability.currentReachabilityStatus.description)
        if reachability.isReachable() {
            if  reachability.isReachableViaWiFi() {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        } else {
            print("Not reachable")
        }
        
    }
    
}

