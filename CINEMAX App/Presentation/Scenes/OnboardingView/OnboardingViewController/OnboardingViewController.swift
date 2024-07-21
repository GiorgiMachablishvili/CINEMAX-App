//
//  ViewController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit
import SnapKit


class OnboardingViewController: UIViewController {
    private var dataSource: OnboardingDataSource?
    private var viewModel: OnboardingViewModelProtocol? = OnboardingViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var primaryButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "ButtonFirstPage"), for: .normal)
        view.backgroundColor = .clear
        view.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var pageControl: CustomPageControl = {
        let view = CustomPageControl()
        view.numberOfPages = viewModel?.OnboardingItems.count ?? 0
        view.currentPage = 0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        configureDataSource()
    }
    
    private func setup() {
        view.addSubview(collectionView)
        view.addSubview(primaryButton)
        view.addSubview(pageControl)
    }
    
    private func layout() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        primaryButton.snp.remakeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-24)
            make.bottom.equalTo(view.snp.bottom).offset(-61)
            make.width.height.equalTo(80)
        }
        
        pageControl.snp.remakeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(24)
            make.bottom.equalTo(view.snp.bottom).offset(-96)
            make.width.equalTo(76)
            make.height.equalTo(10)
        }
    }
    
    private func configureDataSource() {
        guard let viewModel else { return }
        dataSource = OnboardingDataSource(collectionView: collectionView, viewModel: viewModel, pageControl: pageControl, primaryButton: primaryButton)
    }
    
    @objc func pressButton() {
        let nextIndex = pageControl.currentPage + 1
        if nextIndex < viewModel?.OnboardingItems.count ?? 0 {
            let indexPath = IndexPath(item: nextIndex, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = nextIndex
        } else {
            let vc = HomeViewController()
            navigationController?.pushViewController(vc, animated: false)
        }
    }
}
