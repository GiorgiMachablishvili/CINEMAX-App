//
//  OnboardingCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit
import SnapKit

class OnboardingCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textAlignment = .center
        view.font = UIFont.MontserratBold(size: 18)
        view.textColor = UIColor(hexString: "FFFFFF")
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "92929D")
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .clear
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
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(button)
    }
    
    private func layout() {
        imageView.snp.remakeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(421)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(imageView.snp.bottom).offset(46)
            make.height.equalTo(58)
            make.width.equalTo(264)
        }
        
        descriptionLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            //            make.height.equalTo(58)
            make.width.equalTo(264)
        }
        
        button.snp.remakeConstraints { make in
            make.trailing.equalTo(snp.trailing).offset(-24)
            make.bottom.equalTo(snp.bottom).offset(-61)
            make.width.height.equalTo(80)
        }
    }
    
    func config(with data: OnboardingData) {
        imageView.image = data.image
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
}
