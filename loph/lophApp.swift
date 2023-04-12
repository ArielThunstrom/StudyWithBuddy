//
//  lophApp.swift
//  loph
//
//  Created by 90309356 on 4/5/23.
//
import UserNotifications
import SwiftUI
class AppDelegate: NSObject, UIApplicationDelegate{
    func applicationDidEnterBackground( _ application: UIApplication) {
        let content = UNMutableNotificationContent()
        content.title = "app closed"
        content.body = "return back to app"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    
        let request = UNNotificationRequest(identifier: "NotificationIdentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
                   // Handle error
               }
    }
}
@main
struct lophApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
            //studyView()
            
        }
    }
}


