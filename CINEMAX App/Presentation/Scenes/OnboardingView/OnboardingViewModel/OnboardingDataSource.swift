//
//  MovieDataSource.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit
import SnapKit

class OnboardingDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    private var collectionView: UICollectionView
    private var viewModel: OnboardingViewModelProtocol?
    var pageControl: CustomPageControl
    private var primaryButton: UIButton
    
    init(collectionView: UICollectionView, viewModel: OnboardingViewModelProtocol, pageControl: CustomPageControl, primaryButton: UIButton ) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        self.pageControl = pageControl
        self.primaryButton = primaryButton
        
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.registerClass(class: OnboardingCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.OnboardingItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(OnboardingCell.self, for: indexPath)
        if let data = viewModel?.OnboardingItems[indexPath.row] {
            cell.config(with: data)
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard !scrollView.contentOffset.x.isNaN, !scrollView.frame.width.isNaN, !scrollView.contentOffset.x.isInfinite, !scrollView.frame.width.isInfinite, scrollView.frame.width != 0 else { return }
        let pageIndex = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(pageIndex)
        let nextIndex = pageControl.currentPage
        if nextIndex == (viewModel?.OnboardingItems.count ?? 0) - 1 {
            primaryButton.setImage(UIImage(named: "ButtonThirdPage"), for: .normal)
        } else if nextIndex == (viewModel?.OnboardingItems.count ?? 0) - 2 {
            primaryButton.setImage(UIImage(named: "ButtonSecondPage"), for: .normal)
        } else {
            primaryButton.setImage(UIImage(named: "ButtonFirstPage"), for: .normal)
        }
    }
}
