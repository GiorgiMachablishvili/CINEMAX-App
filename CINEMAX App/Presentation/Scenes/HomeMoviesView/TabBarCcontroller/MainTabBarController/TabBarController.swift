//
//  TabBarController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 22.07.24.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        setupControllers()
        customiseTabBar()
    }
    
    private func setupControllers() {
        //MARK: Create the view controllers for each tab
        let firstViewController = HomeViewController()
        firstViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: resizeImage(image: UIImage(named: "Home")!, targetSize: CGSize(width: 48  * Constraint.xCoeff, height: 40 * Constraint.yCoeff)),
            selectedImage: resizeImage(image: UIImage(named: "Home")!, targetSize: CGSize(width: 48 * Constraint.xCoeff, height: 40 * Constraint.yCoeff)))
//        firstViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: -17)
        
        let secondViewController = SearchViewController()
        secondViewController.tabBarItem = UITabBarItem(
            title: nil, 
            image: resizeImage(image: UIImage(named: "Search")!, targetSize: CGSize(width: 48  * Constraint.xCoeff, height: 40 * Constraint.yCoeff)),
            selectedImage: resizeImage(image: UIImage(named: "Search")!, targetSize: CGSize(width: 48  * Constraint.xCoeff, height: 40 * Constraint.yCoeff)))
//        secondViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: -17)
        
        let thirdViewController = DownloadViewController()
        thirdViewController.tabBarItem = UITabBarItem(
            title: nil, 
            image: resizeImage(image: UIImage(named: "Download")!, targetSize: CGSize(width: 48  * Constraint.xCoeff, height: 40 * Constraint.yCoeff)),
            selectedImage: resizeImage(image: UIImage(named: "Download")!, targetSize: CGSize(width: 48  * Constraint.xCoeff, height: 40 * Constraint.yCoeff)))
//        thirdViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: -17)
        
        let forthViewController = PropertyInfoController()
        forthViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: resizeImage(image: UIImage(named: "Account")!, targetSize: CGSize(width: 48  * Constraint.xCoeff, height: 40 * Constraint.yCoeff)),
            selectedImage: resizeImage(image: UIImage(named: "Account")!, targetSize: CGSize(width: 48  * Constraint.xCoeff, height: 40 * Constraint.yCoeff)))
//        forthViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 60)
        
        // Assign the view controllers to the tab bar
        viewControllers = [firstViewController, secondViewController, thirdViewController, forthViewController]
    }
    
    private func customiseTabBar() {
        //MARK: Customise the tab bar appearance
        tabBar.tintColor = UIColor(hexString: "12CDD9")
        tabBar.unselectedItemTintColor = UIColor(hexString: "92929D")
        tabBar.isTranslucent = false
        
        if let items = tabBar.items {
            for item in items {
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 50) // Move title off the visible area
            }
        }
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
            let size = image.size
            
            let widthRatio  = targetSize.width  / size.width
            let heightRatio = targetSize.height / size.height
            
            var newSize: CGSize
            if(widthRatio > heightRatio) {
                newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
            } else {
                newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
            }
            
            let rect = CGRect(origin: .zero, size: newSize)
            
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
            image.draw(in: rect)
            
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return newImage!
        }
}
