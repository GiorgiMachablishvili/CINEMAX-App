//
//  DownloadViewController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 22.07.24.
//

import UIKit
import SnapKit

class DownloadViewController: UIViewController, MovieSelectionDelegate {
    
    var selectedMovie: MovieData?
    
    private var movies: [MovieData] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 327, height: 107)
        layout.minimumLineSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        view.registerClass(class: DownloadCell.self)
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "backButton"), for: .normal)
        view.addTarget(self, action: #selector(tabBackButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var pageTitleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Download"
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.MontserratSemiBold(size: 16)
        view.textAlignment = .center
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        updateInfo()
    }
    
    func didSelectMovie(_ movie: MovieData) {
        selectedMovie = movie
    }
    
    private func setup() {
        view.addSubview(collectionView)
        view.addSubview(pageTitleLabel)
        view.addSubview(backButton)
    }
    
    private func layout() {
        pageTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(58 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(199 * Constraint.xCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
        
        backButton.snp.remakeConstraints { make in
            make.centerY.equalTo(pageTitleLabel.snp.centerY)
            make.leading.equalTo(view.snp.leading).offset(24 * Constraint.xCoeff)
            make.width.height.equalTo(32 * Constraint.xCoeff)
        }
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(pageTitleLabel.snp.bottom).offset(30 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    private func updateInfo() {
        collectionView.reloadData()
    }
    
    @objc func tabBackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension DownloadViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedMovie == nil ? 0 : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(DownloadCell.self, for: indexPath)
        if let movie = selectedMovie {
            cell.configure(with: movie)
        }
        return cell
    }
}
