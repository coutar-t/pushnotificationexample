//
//  NotificationViewController.swift
//  NotificatoinContent
//
//  Created by Thibaut Coutard on 15/04/2018.
//  Copyright © 2018 Thibaut Coutard. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "appleLogo")
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = "Nouveau message : \(notification.request.content.body) with title: \(notification.request.content.title)"
    }

}
