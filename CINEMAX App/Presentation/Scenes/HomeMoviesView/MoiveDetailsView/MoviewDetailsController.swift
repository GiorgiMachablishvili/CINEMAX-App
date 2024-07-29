//
//  MoviewDetailsController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 29.07.24.
//

import UIKit
import SnapKit

class MoviewDetailsController: UIViewController, MoviewDetailsCellDelegate {
    var selectedMovie: MovieData?
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        setup()
        layout()
    }
    
    private func setup() {
        view.addSubview(collectionView)
        collectionView.register(MoviewDetailsCell.self, forCellWithReuseIdentifier: String(describing: MoviewDetailsCell.self))
        collectionView.register(StoryLineCell.self, forCellWithReuseIdentifier: String(describing: StoryLineCell.self))
        configureCompositionLayout()
    }
    
    private func layout() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self?.movieImageLayout()
            case 1:
                return self?.storyViewLayout()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func movieImageLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(552))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(552))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func storyViewLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 24,
            leading: 0,
            bottom: 0,
            trailing: 0)
        return section
    }
    
    private func defaultLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(200 * Constraint.xCoeff))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func goDownloadPageButton() {
        let downloadVC = DownloadViewController()
        if let movie = selectedMovie {
            downloadVC.selectedMovie = movie
        }
        navigationController?.pushViewController(downloadVC, animated: true)
    }
}


extension MoviewDetailsController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MoviewDetailsCell.self), for: indexPath) as! MoviewDetailsCell
            cell.delegate = self
            if let movie = selectedMovie {
                cell.configure(with: movie)
            }
            return cell
        case 1:
            let cell = collectionView.deque(StoryLineCell.self, for: indexPath)
            if let movieInfo = selectedMovie {
                cell.configure(with: movieInfo)
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

