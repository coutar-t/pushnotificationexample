//
//  ViewController.swift
//  PushNotificationExample
//
//  Created by Thibaut Coutard on 15/04/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    @IBOutlet weak var sendNotificationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendNotificationButtonTap(_ sender: Any) {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                self.sendNotification()
            } else {
                self.requestNotification()
            }
        }
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "myNotificationCategory"
        content.title = "My Title"
        content.body = "My body is here"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let notif = UNNotificationRequest(identifier: "notificationIdentifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(notif) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func requestNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                self.sendNotification()
            }
        }
    }
}

