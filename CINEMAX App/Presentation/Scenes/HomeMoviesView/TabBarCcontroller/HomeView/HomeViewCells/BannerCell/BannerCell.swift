//
//  BannerCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 23.07.24.
//

import UIKit
import SnapKit

class BannerCell: UICollectionViewCell {
    
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
        view.layer.cornerRadius = 8
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
    
    private lazy var movieDataLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "EBEBEF")
        view.font = UIFont.MontserratBold(size: 12)
        view.numberOfLines = 1
        view.textAlignment = .left
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
        posterImageView.addSubview(movieNameLabel)
        posterImageView.addSubview(movieDataLabel)
    }
    
    private func layout() {
        shadowView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        posterImageView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        movieNameLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(79 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(16 * Constraint.xCoeff)
            make.width.equalTo(214 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        movieDataLabel.snp.remakeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(4 * Constraint.yCoeff)
            make.leading.equalTo(snp.leading).offset(16 * Constraint.xCoeff)
            make.width.equalTo(107 * Constraint.xCoeff)
            make.height.equalTo(15 * Constraint.yCoeff)
        }
    }
    
    func configure(with data: MovieData) {
        movieNameLabel.text = data.title
        movieDataLabel.text = data.releaseDate
        
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
