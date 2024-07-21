//
//  MovieDataSource.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit

class OnboardingDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    private var collectionView: UICollectionView
    private var viewModel: OnboardingViewModelProtocol?
    
    init(collectionView: UICollectionView, viewModel: OnboardingViewModelProtocol) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: "OnboardingCell")
    }
    
    func pageController() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.OnboardingItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        if let data = viewModel?.OnboardingItems[indexPath.row] {
            cell.config(with: data)
        }
        return cell
    }

}
