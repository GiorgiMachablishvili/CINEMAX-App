import UIKit

extension UICollectionView {
  func registerClass<T: UICollectionViewCell>(class: T.Type) {
    self.register(T.self, forCellWithReuseIdentifier: T.identifier)
  }
  
  func registerNib<T: UICollectionViewCell>(class: T.Type) {
    self.register(T.nib, forCellWithReuseIdentifier: T.identifier)
  }
  
  func deque<T: UICollectionViewCell>(_ classType: T.Type, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
  }
}

