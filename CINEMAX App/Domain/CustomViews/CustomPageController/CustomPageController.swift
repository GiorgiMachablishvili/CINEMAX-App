//
//  CustomPageController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 21.07.24.
//

import UIKit
import SnapKit

class CustomPageControl: UIView {
  var numberOfPages: Int = 0 {
    didSet {
      setupDots()
    }
  }
  var currentPage: Int = 1 {
    didSet {
      updateDots()
    }
  }
  var dotSpacing: CGFloat = 12 * Constraint.xCoeff
  var currentPageDotColor: UIColor = UIColor(hexString: "12CDD9")
  var otherPageDotColor: UIColor = UIColor(hexString: "12CDD9")
  private var dots = [UIView]()
  // Sizes for dots
  var currentDotSize: CGSize = CGSize(width: 32 * Constraint.xCoeff, height: 10 * Constraint.yCoeff) // Size for the current dot
  var otherDotSize: CGSize = CGSize(width: 10 * Constraint.xCoeff, height: 10 * Constraint.yCoeff)  // Size for the other dots
  // Setup dots
  private func setupDots() {
    dots.forEach { $0.removeFromSuperview() }
    dots.removeAll()
    for _ in 0..<numberOfPages {
      let dot = UIView()
      dot.backgroundColor = otherPageDotColor
      dot.layer.cornerRadius = otherDotSize.height / 2
      dot.translatesAutoresizingMaskIntoConstraints = false
      addSubview(dot)
      dots.append(dot)
    }
     
    setNeedsLayout()
    layoutIfNeeded()
  }
   
  // Update dots appearance
  private func updateDots() {
    for (index, dot) in dots.enumerated() {
      if index + 1 == currentPage {
        dot.backgroundColor = currentPageDotColor
        dot.frame.size = currentDotSize
      } else {
        dot.backgroundColor = otherPageDotColor
        dot.frame.size = otherDotSize
      }
    }
    setNeedsLayout()
    layoutIfNeeded()
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    // Calculate the total width required for the dots
    let totalWidth = CGFloat(numberOfPages) * currentDotSize.width + CGFloat(numberOfPages - 1) * dotSpacing
    // Calculate starting x position to center the dots
    let startX = (bounds.width - totalWidth) / 2
    var currentX = startX
    for (index, dot) in dots.enumerated() {
      let dotSize = index + 1 == currentPage ? currentDotSize : otherDotSize
      dot.frame = CGRect(x: currentX, y: (bounds.height - dotSize.height) / 2, width: dotSize.width, height: dotSize.height)
      currentX += dotSize.width + dotSpacing
    }
  }
}
