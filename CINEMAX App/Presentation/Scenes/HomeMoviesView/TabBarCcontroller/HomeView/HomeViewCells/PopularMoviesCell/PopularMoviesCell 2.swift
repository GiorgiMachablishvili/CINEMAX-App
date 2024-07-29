//
//  PopularMoviesCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 24.07.24.
//

import UIKit
import SnapKit

class PopularMoviesCell: UICollectionViewCell {
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.6
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        view.layer.shadowColor = UIColor.label.withAlphaComponent(0.4).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 5
        return view
    }()
    
    private lazy var posterImageView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemBackground
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 14
        return view
    }()
    
    private lazy var movieNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.MontserratBold(size: 16)
        view.numberOfLines = 1
        view.textAlignment = .center
        return view
    }()
    
    private lazy var raitingView: RaitingView = {
        let view = RaitingView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(shadowView)
        shadowView.addSubview(posterImageView)
        shadowView.addSubview(movieNameLabel)
        shadowView.addSubview(raitingView)
    }
    
    private func layout() {
        shadowView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        posterImageView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(178 * Constraint.yCoeff)
        }
        
        movieNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(8 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        raitingView.snp.remakeConstraints { make in
            make.top.equalTo(posterImageView.snp.top).offset(8 * Constraint.yCoeff)
            make.trailing.equalTo(posterImageView.snp.trailing).offset(-8 * Constraint.xCoeff)
            make.width.equalTo(65 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
    }
    
    func configurePopularMovies(with data: MovieData) {
        movieNameLabel.text = data.title
        let doubleRaitingNumber = data.voteAverage
        let roundedRaitingNumber = round(doubleRaitingNumber * 10) / 10
        raitingView.setRaiting(roundedRaitingNumber)
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.posterPath)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self.posterImageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
