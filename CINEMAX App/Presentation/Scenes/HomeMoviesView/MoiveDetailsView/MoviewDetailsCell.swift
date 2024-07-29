//
//  MoviewDetailsCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 29.07.24.
//

import UIKit
import SnapKit

protocol MoviewDetailsCellDelegate: AnyObject {
    func didTapBackButton()
    func goDownloadPageButton()
}

class MoviewDetailsCell: UICollectionViewCell {
    weak var delegate: MoviewDetailsCellDelegate?
    
    var selectedMovie: MovieData?
    
    private lazy var movieShadowView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .systemBackground.withAlphaComponent(20)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "backButton"), for: .normal)
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(backPage), for: .touchUpInside)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.MontserratSemiBold(size: 16)
        view.textAlignment = .center
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
    
    private lazy var movieInfoView: MovieDetailsInfoView = {
        let view = MovieDetailsInfoView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var ratingView: RatingView = {
        let view = RatingView()
        return view
        }()
    
    private lazy var playButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "playButton"), for: .normal)
        view.addTarget(self, action: #selector(goDownloadPage), for: .touchUpInside)
        return view
    }()
    
    private lazy var downloadButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "downloadButton"), for: .normal)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var groupButtonButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "GroupButton"), for: .normal)
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
        addSubview(movieShadowView)
        movieShadowView.addSubview(backButton)
        movieShadowView.addSubview(titleLabel)
        movieShadowView.addSubview(movieImage)
        movieShadowView.addSubview(movieInfoView)
        movieShadowView.addSubview(ratingView)
        movieShadowView.addSubview(playButton)
        movieShadowView.addSubview(downloadButton)
        movieShadowView.addSubview(groupButtonButton)
    }
    
    private func layout() {
        movieShadowView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(552 * Constraint.xCoeff)
        }
        
        backButton.snp.remakeConstraints { make in
            make.top.equalTo(movieShadowView.snp.top).offset(56 * Constraint.yCoeff)
            make.leading.equalTo(movieShadowView.snp.leading).offset(28 * Constraint.xCoeff)
            make.width.height.equalTo(24 * Constraint.xCoeff)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.leading.equalTo(backButton.snp.trailing).offset(32 * Constraint.xCoeff)
            make.width.equalTo(199 * Constraint.xCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
        
        movieImage.snp.remakeConstraints { make in
            make.centerX.equalTo(movieShadowView.snp.centerX)
            make.top.equalTo(movieShadowView.snp.top).offset(108 * Constraint.yCoeff)
            make.width.equalTo(205 * Constraint.xCoeff)
            make.height.equalTo(287 * Constraint.yCoeff)
        }

        movieInfoView.snp.remakeConstraints { make in
            make.centerX.equalTo(movieImage.snp.centerX)
            make.top.equalTo(movieImage.snp.bottom).offset(16 * Constraint.yCoeff)
            make.width.equalTo(274 * Constraint.xCoeff)
            make.height.equalTo(32 * Constraint.xCoeff)
        }
        
        ratingView.snp.remakeConstraints { make in
            make.centerX.equalTo(movieInfoView.snp.centerX)
            make.top.equalTo(movieInfoView.snp.bottom).offset(8 * Constraint.yCoeff)
            make.width.equalTo(55 * Constraint.xCoeff)
            make.height.equalTo(24 * Constraint.yCoeff)
        }
        
        playButton.snp.remakeConstraints { make in
            make.top.equalTo(ratingView.snp.bottom).offset(24 * Constraint.yCoeff)
            make.leading.equalTo(movieShadowView.snp.leading).offset(65 * Constraint.xCoeff)
            make.width.equalTo(115 * Constraint.xCoeff)
            make.height.equalTo(48 * Constraint.yCoeff)
        }
        
        downloadButton.snp.remakeConstraints { make in
            make.centerY.equalTo(playButton.snp.centerY)
            make.leading.equalTo(playButton.snp.trailing).offset(16 * Constraint.xCoeff)
            make.width.equalTo(48 * Constraint.xCoeff)
            make.height.equalTo(48 * Constraint.yCoeff)
        }
        
        groupButtonButton.snp.remakeConstraints { make in
            make.centerY.equalTo(playButton.snp.centerY)
            make.leading.equalTo(downloadButton.snp.trailing).offset(16 * Constraint.xCoeff)
            make.width.equalTo(48 * Constraint.xCoeff)
            make.height.equalTo(48 * Constraint.yCoeff)
        }
    }
    
    func configure(with data: MovieData) {
        titleLabel.text = data.title
        
        let doubleRaitingNumber = data.voteAverage
        let roundedRaitingNumber = round(doubleRaitingNumber * 10) / 10
        ratingView.setRaiting(roundedRaitingNumber)
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.posterPath)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self.movieShadowView.image = UIImage(data: data)
                    self.movieImage.image = UIImage(data: data)
                }
            }
        }.resume()
    }
    
    @objc func backPage() {
        delegate?.didTapBackButton()
    }
    
    @objc func goDownloadPage() {
        delegate?.goDownloadPageButton()
    }
}
