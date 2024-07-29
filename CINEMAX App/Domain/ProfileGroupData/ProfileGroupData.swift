//
//  ProfileGroupData.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 26.07.24.
//

import UIKit

struct ProfileGroupData {
    let notificationCellImage: UIImage
    let title: String
    let button: UIImage
}

let generalData = [
    ProfileGroupData.init(notificationCellImage: UIImage(named: "notification")!, title: "Notification", button: UIImage(systemName: "chevron.right")!),
    ProfileGroupData.init(notificationCellImage: UIImage(named: "language")!, title: "Language", button: UIImage(systemName: "chevron.right")!),
    ProfileGroupData.init(notificationCellImage: UIImage(named: "country")!, title: "Country", button: UIImage(systemName: "chevron.right")!),
    ProfileGroupData.init(notificationCellImage: UIImage(named: "clear")!, title: "Clear Cache", button: UIImage(systemName: "chevron.right")!)
]

let moreData = [
    ProfileGroupData.init(notificationCellImage: UIImage(named: "L&P")!, title: "Legal and Policies", button: UIImage(systemName: "chevron.right")!),
    ProfileGroupData.init(notificationCellImage: UIImage(named: "H&F")!, title: "Help & Feedback", button: UIImage(systemName: "chevron.right")!),
    ProfileGroupData.init(notificationCellImage: UIImage(named: "aboutUs")!, title: "About Us", button: UIImage(systemName: "chevron.right")!)
]

