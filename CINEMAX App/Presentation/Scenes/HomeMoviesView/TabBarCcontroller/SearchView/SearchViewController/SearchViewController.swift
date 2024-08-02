//
//  SearchViewController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 22.07.24.
//

import UIKit
import SnapKit

protocol MovieSelectionDelegate: AnyObject {
    func didSelectMovie(_ movie: MovieData)
}

class SearchViewController: UIViewController {
    weak var delegate: MovieSelectionDelegate?
    
    private var movies: [MovieData] = []
    private var filteredMovies: [MovieData] = []
    
    let searchBar = UISearchBar()
    
    private lazy var moviesView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 147)
        layout.minimumLineSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        return view
    }()
    
    private lazy var emptyStateLabel: UILabel = {
        let view = UILabel()
        view.text = "You can't find movie"
        view.textColor = UIColor(hexString: "92929D")
        view.font = UIFont.MontserratBold(size: 16)
        view.textAlignment = .center
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        setupSearchBar()
        addTapGestureRecogniser()
        collectionView.registerClass(class: MoviesViewForSearchCell.self)
        fetchMovies()
        
        NotificationCenter.default.post(name: NSNotification.Name("MovieSelected"), object: nil)
    }
    
    private func setup() {
        view.addSubview(moviesView)
        moviesView.addSubview(searchBar)
        view.addSubview(collectionView)
        view.addSubview(emptyStateLabel)
    }
    
    private func layout() {
        // Set constraints
        moviesView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        searchBar.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(52 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(10 * Constraint.xCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-10 * Constraint.xCoeff)
            make.height.equalTo(44 * Constraint.yCoeff)
        }
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(5 * Constraint.yCoeff)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        emptyStateLabel.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Type title, categories, years, etc"
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .clear
        
        // Customizing the search bar appearance
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor(hexString: "252836")
            textField.textColor = UIColor.white
            if let leftView = textField.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.white
            }
            textField.attributedPlaceholder = NSAttributedString(string: "Type title, categories, years, etc", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "92929D")])
        }
    }
    
    private func addTapGestureRecogniser() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func fetchMovies() {
        let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=778eb3349e13f63150533983bc20b715&language=en-US&page=1/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg"
        NetworkManager.shared.get(url: url) { [weak self] (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let response):
                self?.movies = response.results
                self?.filteredMovies = response.results
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch movies: \(error)")
            }
        }
    }
    
    private func updateEmptyStateLabelVisibility() {
        emptyStateLabel.isHidden = !filteredMovies.isEmpty
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredMovies = movies
        } else {
            filteredMovies = movies.filter { movie in
                movie.title.lowercased().contains(searchText.lowercased())
            }
        }
        collectionView.reloadData()
        updateEmptyStateLabelVisibility()
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(MoviesViewForSearchCell.self, for: indexPath)
        let movie = filteredMovies[indexPath.row]
        cell.configureMovieSearch(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = filteredMovies[indexPath.row]
            delegate?.didSelectMovie(selectedMovie)

            let movieEntity = selectedMovie.toMovieEntity(context: CoreDataStack.shared.context)
            let manager = CoreDataManager<MovieEntity>()
            manager.save(movieEntity)
            
            let movieInfoVC = MoviewDetailsController()
            movieInfoVC.selectedMovie = selectedMovie
            navigationController?.pushViewController(movieInfoVC, animated: true)
    }
}

