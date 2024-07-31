//
//  HomeViewController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 21.07.24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UISearchBarDelegate {
    private var movies: [MovieData] = []
    private var selectedCategoryCell: CategoryCell?
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        view.contentInset = .init(top: 0, left: 0, bottom: 40, right: 0)
        return view
    }()
    
    private lazy var infoView: HeaderView = {
        let view = HeaderView()
        return view
    }()
    
    private lazy var searchBarCell: SearchBarCell = {
           let cell = SearchBarCell()
           cell.configure(delegate: self)
           return cell
       }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        configureCompositionLayout()
        fetchMovies()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setup() {
        collectionView.registerClass(class: HeaderCell.self)
        collectionView.registerClass(class: SearchBarCell.self)
        collectionView.registerClass(class: BannerCell.self)
        collectionView.register(
            BannerReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: BannerReusableView.reuseIdentifier
        )
        collectionView.registerClass(class: CategoryCell.self)
        collectionView.register(
            CategoryHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CategoryHeaderView.reuseIdentifier
        )
        collectionView.registerClass(class: PopularMoviesCell.self)
        collectionView.register(
            PopularMoviesReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: PopularMoviesReusableView.reuseIdentifier
        )
        view.addSubview(infoView)
        view.addSubview(collectionView)
    }
    
    private func layout() {
        infoView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self?.headerSectionLayout()
            case 1:
                return self?.searchBarLayout()
            case 2:
                return self?.movieBannerLayout()
            case 3:
                return self?.categoryButtonLayout()
            case 4:
                return self?.popularMovies()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func headerSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func searchBarLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 32,
            leading: 24,
            bottom: 24,
            trailing: 24
        )
        return section
    }
    
    private func movieBannerLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 12
        
        //MARK: does not working...
//        section.visibleItemsInvalidationHandler = {(items, offset, environment) in
//            items.forEach { item in
//                let distanceFromCenter = abs((item.frame.midX) - environment.container.contentSize.width / 2.0)
//                let minScale: CGFloat = 0.8
//                let maxScale: CFloat = 1.0
//                let scale = max(CGFloat(maxScale) - (distanceFromCenter / environment.container.contentSize.width), minScale)
//                item.transform = CGAffineTransform(scaleX: scale, y: scale)
//            }
//        }
        
        let footerSize = NSCollectionLayoutSize(widthDimension: .absolute(60), heightDimension: .absolute(20))
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        section.boundarySupplementaryItems = [sectionFooter]
        
        return section
    }
    
    private func categoryButtonLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(75), heightDimension: .absolute(75))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 8
        section.contentInsets = .init(
            top: 24,
            leading: 0,
            bottom: 0,
            trailing: 1
        )
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func popularMovies() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 12
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
    
    private func defaultLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func fetchMovies() {
        let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=778eb3349e13f63150533983bc20b715&language=en-US&page=1/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg"
        NetworkManager.shared.get(url: url) { [weak self] (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let response):
                self?.movies = response.results
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch movies: \(error)")
            }
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            for index in 0..<buttonCategoryData.count {
                buttonCategoryData[index].isSelected = false
            }
            buttonCategoryData[indexPath.row].isSelected = true
            collectionView.reloadData()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return movies.count
        case 3:
            return buttonCategoryData.count
        case 4:
            return movies.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.deque(HeaderCell.self, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.deque(SearchBarCell.self, for: indexPath)
            cell.configure(delegate: self)
            return cell
        case 2:
            let cell = collectionView.deque(BannerCell.self, for: indexPath)
            let movie = movies[indexPath.row]
            cell.configure(with: movie)
            return cell
        case 3:
            let cell = collectionView.deque(CategoryCell.self, for: indexPath)
            cell.cellData = buttonCategoryData[indexPath.row]
            return cell
        case 4:
            let cell = collectionView.deque(PopularMoviesCell.self, for: indexPath)
            let movie = movies[indexPath.row]
            cell.configurePopularMovies(with: movie)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            if indexPath.section == 2 {
                let footer = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: BannerReusableView.reuseIdentifier,
                    for: indexPath
                ) as! BannerReusableView
                footer.configureFooter(with: movies.count, currentPage: 0)
                return footer
            }
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 3 {
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: CategoryHeaderView.reuseIdentifier,
                    for: indexPath
                ) as! CategoryHeaderView
                return header
            } else if indexPath.section == 4 {
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: PopularMoviesReusableView.reuseIdentifier,
                    for: indexPath
                ) as! PopularMoviesReusableView
                return header
            }
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }

    
    
    
    // UIScrollViewDelegate methods
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == collectionView else { return }
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        
        if indexPath.section == 2 {
            let page = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
            let footer = collectionView.supplementaryView(
                forElementKind: UICollectionView.elementKindSectionFooter,
                at: IndexPath(item: 0, section: 2)
            ) as? BannerReusableView
            footer?.configureFooter(with: movies.count, currentPage: page)
        }
    }
}

extension HomeViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == collectionView
    }
}
