import UIKit

extension UICollectionViewCell {
  static var identifier: String { String(describing: self) }
  static var nib: UINib { UINib(nibName: identifier, bundle: Bundle.main) }
}
