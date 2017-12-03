//
//  AppDelegate.swift
//  EvatorHackaton
//
//  Created by user name on 28/11/2017.
//  Copyright © 2017 TM. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //Carts
    private var cartModels: [CartModel] = []
    private var lastRemovedId: Int?
    
    private var _ehTabBarController: TabBarController?
    public var ehTabBarController: TabBarController {
        get { return _ehTabBarController! }
        set(value) {
            _ehTabBarController = value
        }
    }
    
    //Orders
    private var notSendedOder: OrderModel!
    private var orders: [OrderModel] = []
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
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
    
    
    //MARK: Working with carts
    func addModelToCartModel(model: CartModel) {
        self.cartModels.append(model)
    }
    
    func getCarts() -> [CartModel] {
        for (index,cartModel) in self.cartModels.enumerated() {
            if cartModel.itemCount == 0 {
                self.cartModels.remove(at: index)
            }
        }
        
        return self.cartModels
    }
    
    func updateCartModel(by id: Int, and itemCount: Int) {
        for (index, model) in self.cartModels.enumerated() {
            if (model.id == id) {
                var t_model = model
                self.cartModels[index].itemCount = itemCount                
            }
        }
    }
    
    func removeLastCart() {
        self.cartModels.removeLast()
    }
    
    func removeCart(byId id: Int) {
        if self.lastRemovedId == id { return }
        for (index, model) in self.cartModels.enumerated() {
            if (model.id == id) {
                self.cartModels.remove(at: index)
                self.lastRemovedId = id
            }
        }
    }
    //MARK:
    
    //MARK: Working with orders
    func addNotSendedOrder(model: OrderModel) {
        self.notSendedOder = model
    }
    
    func getNotSendedOrder() -> OrderModel? {
        return self.notSendedOder
    }
    
    func addOrder(byModel model: OrderModel) {
        self.orders.append(model)
    }
    
    func getOrders() -> [OrderModel] {
        return self.orders
    }
    
    //MARK:
    
    //MARK: TabBar interface
    func setCurrentTab(toIndex index:Int) {
        self._ehTabBarController?.selectedIndex = index
    }
    
    //MARK:
}

