//
//  MoviesViewForSearchCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 25.07.24.
//

import UIKit
import SnapKit

class MoviesViewForSearchCell: UICollectionViewCell {
    private lazy var movieView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var raitingView: RaitingView = {
        let view = RaitingView()
        return view
    }()
    
    private lazy var posterImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemBackground
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var movieQualityImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "premium")
        return view
    }()
    
    private lazy var movieNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.MontserratBold(size: 16)
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()
    
    private lazy var movieDataLabel: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "data")
        return view
    }()
    
    private lazy var movieDurationImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Time")
        return view
    }()
    
    private lazy var moviePgImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "pg13")
        return view
    }()
    
    private lazy var movieActionImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "action")
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
        addSubview(movieView)
        movieView.addSubview(posterImageView)
        posterImageView.addSubview(raitingView)
        movieView.addSubview(movieQualityImage)
        movieView.addSubview(movieNameLabel)
        movieView.addSubview(movieDataLabel)
        movieView.addSubview(movieDurationImage)
        movieView.addSubview(moviePgImage)
        movieView.addSubview(movieActionImage)
    }
    
    private func layout() {
        movieView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        posterImageView.snp.remakeConstraints { make in
            make.top.bottom.equalTo(movieView)
            make.leading.equalTo(movieView.snp.leading).offset(24 * Constraint.xCoeff)
            make.width.equalTo(112 * Constraint.xCoeff)
        }
        
        raitingView.snp.remakeConstraints { make in
            make.top.equalTo(posterImageView.snp.top).offset(8 * Constraint.yCoeff)
            make.leading.equalTo(posterImageView.snp.leading).offset(18 * Constraint.xCoeff)
            make.width.equalTo(55 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
        
        movieQualityImage.snp.remakeConstraints { make in
            make.top.equalTo(movieView.snp.top).offset(5 * Constraint.yCoeff)
            make.leading.equalTo(posterImageView.snp.trailing).offset(16 * Constraint.xCoeff)
            make.width.equalTo(65 * Constraint.xCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
        
        movieNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(movieQualityImage.snp.bottom).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(posterImageView.snp.trailing).offset(16 * Constraint.xCoeff)
            make.width.equalTo(199 * Constraint.xCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
        
        movieDataLabel.snp.remakeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(posterImageView.snp.trailing).offset(16 * Constraint.xCoeff)
            make.width.equalTo(47 * Constraint.xCoeff)
            make.height.equalTo(16 * Constraint.yCoeff)
        }
        
        movieDurationImage.snp.remakeConstraints { make in
            make.top.equalTo(movieDataLabel.snp.bottom).offset(14 * Constraint.yCoeff)
            make.leading.equalTo(posterImageView.snp.trailing).offset(16 * Constraint.xCoeff)
            make.width.equalTo(94 * Constraint.xCoeff)
            make.height.equalTo(16 * Constraint.yCoeff)
        }
        
        moviePgImage.snp.remakeConstraints { make in
            make.centerY.equalTo(movieDurationImage.snp.centerY)
            make.leading.equalTo(movieDurationImage.snp.trailing).offset(12 * Constraint.xCoeff)
            make.width.equalTo(43 * Constraint.xCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
        
        movieActionImage.snp.remakeConstraints { make in
            make.top.equalTo(movieDurationImage.snp.bottom).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(posterImageView.snp.trailing).offset(16 * Constraint.xCoeff)
            make.width.equalTo(114 * Constraint.xCoeff)
            make.height.equalTo(16 * Constraint.yCoeff)
        }
    }
    
    func configureMovieSearch(with data: MovieData) {
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



