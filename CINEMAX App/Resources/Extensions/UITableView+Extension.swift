//
//  UITableView+Extension.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit

extension UITableView {
    func registerClass<T: UITableViewCell>(class: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }

    
    func registerNib<T: UITableViewCell>(class: T.Type) {
        self.register(T.nib, forCellReuseIdentifier: T.identifier)
    }
    
    func registerHeaderFooterNib<T: UIView>(class: T.Type) {
        let name = String(describing: T.self)
        let nib = UINib(nibName: name, bundle: Bundle.main)
        self.register(nib, forHeaderFooterViewReuseIdentifier: name)
    }
    
    func deque<T: UITableViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

extension UICollectionView {
    func registerCollectionViewClass<T: UICollectionViewCell>(class: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
}

