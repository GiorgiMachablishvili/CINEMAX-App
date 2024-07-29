//
//  BannerReusableView.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 27.07.24.
//

import UIKit
import SnapKit

class BannerReusableView: UICollectionReusableView {
    static let reuseIdentifier = "BannerReusableView"
    
    private lazy var pageControl: CustomPageControl = {
        let view = CustomPageControl()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(pageControl)
    }
    
    private func layout() {
        pageControl.snp.remakeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//            make.height.equalTo(8)
//            make.width.equalTo(60)
            make.center.equalToSuperview()
        }
    }
    
    func configureFooter(with numberOfPages: Int, currentPage: Int) {
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
    }
}

