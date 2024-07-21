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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        configureDataSource()
    }
    
    private func setup() {
        view.addSubview(collectionView)
    }
    
    private func layout() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureDataSource() {
        guard let viewModel else { return }
        dataSource = OnboardingDataSource(collectionView: collectionView, viewModel: viewModel)
    }
}
