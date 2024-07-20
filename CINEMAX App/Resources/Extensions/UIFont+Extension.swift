//
//  UIFont+Extension.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit

extension UIFont {
    //MARK: font extension
    static func MontserratRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func MontserratExtraBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-ExtraBold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func MontserratSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-SemiBold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func MontserratBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func MontserratThin(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Thin", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func MontserratMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Medium", size: size) ?? .systemFont(ofSize: size)
    }
}
