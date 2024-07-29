//
//  DownloadCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 26.07.24.
//

import UIKit
import SnapKit

class DownloadCell: UICollectionViewCell, MovieSelectionDelegate {
    
    var selectedMovie: MovieData?
    
    private lazy var shadowView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "252836")
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var movieImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .systemBackground
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var playImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "playImage")
        return view
    }()
    
    private lazy var actionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Action"
        view.textColor = UIColor(hexString: "EBEBEF")
        view.font = UIFont.MontserratMedium(size: 12)

        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.MontserratSemiBold(size: 14)
        return view
    }()
    
    private lazy var movieLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Movie"
        view.textColor = UIColor(hexString: "92929D")
        view.font = UIFont.MontserratMedium(size: 12)
        return view
    }()
    
    private lazy var raitingView: RaitingView = {
        let view = RaitingView()
        return view
        }()
    
    private lazy var likeImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Wishlist")
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
    
    func didSelectMovie(_ movie: MovieData) {
        selectedMovie = movie
    }
    
    private func setup() {
        addSubview(shadowView)
        shadowView.addSubview(movieImage)
        movieImage.addSubview(playImage)
        shadowView.addSubview(actionLabel)
        shadowView.addSubview(titleLabel)
        shadowView.addSubview(movieLabel)
        shadowView.addSubview(raitingView)
        shadowView.addSubview(likeImage)
    }
    
    private func layout() {
        shadowView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        movieImage.snp.remakeConstraints { make in
            make.top.equalTo(shadowView.snp.top).offset(12 * Constraint.yCoeff)
            make.leading.equalTo(shadowView.snp.leading).offset(12 * Constraint.xCoeff)
            make.bottom.equalTo(shadowView.snp.bottom).offset(-12 * Constraint.yCoeff)
            make.height.equalTo(83 * Constraint.yCoeff)
            make.width.equalTo(121 * Constraint.xCoeff)
        }
        
        playImage.snp.remakeConstraints { make in
            make.center.equalTo(movieImage)
            make.width.height.equalTo(50 * Constraint.xCoeff)
        }
        
        actionLabel.snp.remakeConstraints { make in
            make.top.equalTo(shadowView.snp.top).offset(13 * Constraint.yCoeff)
            make.leading.equalTo(movieImage.snp.trailing).offset(16 * Constraint.xCoeff)
            make.height.equalTo(15 * Constraint.yCoeff)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.top.equalTo(actionLabel.snp.bottom).offset(6 * Constraint.yCoeff)
            make.leading.equalTo(movieImage.snp.trailing).offset(16 * Constraint.yCoeff)
            make.trailing.equalTo(shadowView.snp.trailing).offset(-12 * Constraint.yCoeff)
            make.height.equalTo(34 * Constraint.yCoeff)
        }
        
        movieLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6 * Constraint.yCoeff)
            make.leading.equalTo(movieImage.snp.trailing).offset(16 * Constraint.xCoeff)
            make.width.equalTo(37 * Constraint.xCoeff)
            make.height.equalTo(15 * Constraint.yCoeff)
        }
        
        raitingView.snp.remakeConstraints { make in
            make.centerY.equalTo(movieLabel.snp.centerY)
            make.leading.equalTo(movieLabel.snp.trailing).offset(8 * Constraint.xCoeff)
            make.width.equalTo(55 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
        
        likeImage.snp.remakeConstraints { make in
            make.top.equalTo(shadowView.snp.top).offset(63 * Constraint.yCoeff)
            make.trailing.equalTo(shadowView.snp.trailing).offset(-12 * Constraint.xCoeff)
            make.width.height.equalTo(32 * Constraint.xCoeff)
        }
    }
    
    func configure(with data: MovieData) {
        titleLabel.text = data.title
        
        let doubleRaitingNumber = data.voteAverage
        let roundedRaitingNumber = round(doubleRaitingNumber * 10) / 10
        raitingView.setRaiting(roundedRaitingNumber)
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.posterPath)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self.movieImage.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
