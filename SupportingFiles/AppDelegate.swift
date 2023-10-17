//
//  AppDelegate.swift
//  uia
//
//  Created by EMPULSE on 19/09/23.
//

import UIKit
import CoreData
import Network
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var timer: Timer?
    var topNavigationBar: TopNavigationBar? 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UITabBar.appearance().barTintColor = UIColor.blue
        self.window?.rootViewController = launchScreenVC
        self.window?.makeKeyAndVisible()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(checkInternetReachability), userInfo: nil, repeats: true)
        return true
    }
    @objc func checkInternetReachability() {
//        NetworkManager.shared.isInternetAvailable() ? showAlert(isOnline: "Online")  : showAlert(isOnline: "Offline")
        }


    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "uia")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func showAlert(isOnline: String) {
        var style = ToastStyle()
            let alert = UIAlertController(
                title: "Internet Status",
                message: "Internet is available.",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            // Present the alert on the root view controller
            if let rootViewController = self.window?.rootViewController {
//                rootViewController.present(alert, animated: true, completion: nil)
                rootViewController.view.makeToast("You are \(isOnline)", duration: 5.0, position: .top, style: style)
            }
        }

}

