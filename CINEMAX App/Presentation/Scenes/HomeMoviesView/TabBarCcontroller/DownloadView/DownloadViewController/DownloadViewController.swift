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
    
    private var movies: [MovieEntity] = []

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
        fetchMovies()
        
        NotificationCenter.default.addObserver(self, selector: #selector(fetchMovies), name: NSNotification.Name("MovieSelected"), object: nil)
    }

    func didSelectMovie(_ movie: MovieData) {
        selectedMovie = movie
    }
    
    @objc private func fetchMovies() {
    let manager = CoreDataManager<MovieEntity>()
    movies = manager.fetchAll()
    collectionView.reloadData()
  }

    private func setup() {
        view.addSubview(collectionView)
        view.addSubview(pageTitleLabel)
        view.addSubview(backButton)
    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    collectionView.reloadData()
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
    return movies.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.deque(DownloadCell.self, for: indexPath)
    cell.configure(with: movies[indexPath.row])
    return cell
  }
}
