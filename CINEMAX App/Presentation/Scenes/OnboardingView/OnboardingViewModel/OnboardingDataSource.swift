//
//  MovieDataSource.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit

class OnboardingDataSource: NSObject, UICollectionViewDataSource {
    private var tableView: UITableView
    private var viewModel: OnboardingViewModelProtocol?
    
    init(tableView: UITableView, viewModel: OnboardingViewModelProtocol) {
        self.tableView = tableView
        self.viewModel = viewModel
        
        super.init()
        self.tableView.dataSource
        self.tableView.delegate
        self.tableView.register(OnboardingCell.self, forCellReuseIdentifier: "OnboardingCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.OnboardingItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
//        cell.config(with: indexPath.row)
        return cell
    }
}
