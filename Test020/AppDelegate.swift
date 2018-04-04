//
//  AppDelegate.swift
//  Test020
//
//  Created by Nacho Garcia on 3/4/18.
//  Copyright © 2018 com.nacho. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainRouteCoordinator : RouterCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.makeDepencyGraph()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainRouteCoordinator?.rootViewController
        window?.makeKeyAndVisible()
        return true
    }

    func makeDepencyGraph(){
        let container = Container()
        
        container.register(WebServiceLayer.self) { r in
            WebServiceLayer()
            }.inObjectScope(.container)
        
        container.register(ViewModelProvider.self) { r in
            ViewModelProvider(network: r.resolve(WebServiceLayer.self)!)
            }.inObjectScope(.transient)
        
        container.register(DetailRecipeViewModelProvider.self) { r in
            DetailRecipeViewModelProvider()
            }.inObjectScope(.transient)
        
        container.register(DetailRouterCoordinatorProvider.self) { r in
            DetailRouterCoordinatorProvider(detailRecipeViewModelProvider: r.resolve(DetailRecipeViewModelProvider.self)!)
            }.inObjectScope(.transient)
        
        container.register(RouterCoordinator.self) {r in
            RouterCoordinator(network: r.resolve(WebServiceLayer.self)!,
                              viewModelProvider: r.resolve(ViewModelProvider.self)!,
                              detailRecipeCoordinatorProvider: r.resolve(DetailRouterCoordinatorProvider.self)!)
            }.inObjectScope(.transient)

        mainRouteCoordinator = container.resolve(RouterCoordinator.self)!
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

