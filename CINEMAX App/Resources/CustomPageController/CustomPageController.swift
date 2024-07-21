//
//  CustomPageController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 21.07.24.
//

import UIKit

class CustomPageControl: UIPageControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // Customize the appearance
        currentPageIndicatorTintColor = UIColor(hexString: "FFFFFF")
        pageIndicatorTintColor = UIColor(hexString: "12CDD9")
    }
}

//import UIKit
//
//class CustomPageControl: UIViewController, UIScrollViewDelegate {
//
//    private let scrollView = UIScrollView()
//    private let pageControl = UIPageControl()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupScrollView()
//        setupPageControl()
//    }
//    
//    private func setupScrollView() {
//        scrollView.delegate = self
//        scrollView.isPagingEnabled = true
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.frame = view.bounds
//        view.addSubview(scrollView)
//        
//        // Setup content in scroll view (for example, 3 pages)
//        for i in 0..<3 {
//            let page = UIView(frame: CGRect(x: CGFloat(i) * view.frame.width, y: 0, width: view.frame.width, height: view.frame.height))
//            page.backgroundColor = UIColor(red: CGFloat(i) * 0.33, green: 0.5, blue: 0.5, alpha: 1)
//            scrollView.addSubview(page)
//        }
//        
//        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: view.frame.height)
//    }
//    
//    private func setupPageControl() {
//        pageControl.numberOfPages = 3
//        pageControl.currentPage = 0
//        pageControl.pageIndicatorTintColor = UIColor.lightGray
//        pageControl.currentPageIndicatorTintColor = UIColor.blue
//        pageControl.frame = CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width, height: 50)
//        pageControl.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
//        view.addSubview(pageControl)
//    }
//    
//    @objc private func pageControlDidChange() {
//        let pageIndex = pageControl.currentPage
//        let offset = CGPoint(x: CGFloat(pageIndex) * view.frame.width, y: 0)
//        scrollView.setContentOffset(offset, animated: true)
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
//        pageControl.currentPage = Int(pageIndex)
//        
//        updatePageControlAppearance()
//    }
//    
//    private func updatePageControlAppearance() {
//        let pageIndex = pageControl.currentPage
//        let numberOfPages = pageControl.numberOfPages
//        
//        for (index, dot) in pageControl.subviews.enumerated() {
//            let isActive = index == pageIndex
//            dot.transform = CGAffineTransform(scaleX: isActive ? 1.5 : 1.0, y: 1.0)
//            dot.backgroundColor = isActive ? UIColor.red : UIColor.lightGray
//        }
//    }
//}
