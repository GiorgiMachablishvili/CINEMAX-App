//
//  UITableViewCell+Extension.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit

extension UITableViewCell {
  static var identifier: String { String(describing: self) }
  static var nib: UINib { UINib(nibName: identifier, bundle: Bundle.main) }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

