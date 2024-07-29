//
//  HeaderView.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 23.07.24.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    private lazy var profileImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "avatarTamaz")
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Hello, Tamaz"
        view.font = UIFont.MontserratExtraBold(size: 16)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .right
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var sloganLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Let’s stream your favorite movie"
        view.font = UIFont.MontserratRegular(size: 12)
        view.textColor = UIColor(hexString: "92929D")
        view.textAlignment = .right
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var favoriteImage: UIImageView = {
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
    
    private func setup(){
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(sloganLabel)
        addSubview(favoriteImage)
    }
    
    private func layout(){
        profileImage.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(snp.leading).offset(24 * Constraint.xCoeff)
            make.width.height.equalTo(40 * Constraint.xCoeff)
        }
        
        nameLabel.snp.remakeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(profileImage.snp.trailing).offset(16 * Constraint.xCoeff)
            make.bottom.equalTo(snp.bottom).offset(-20 * Constraint.yCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
        
        sloganLabel.snp.remakeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4 * Constraint.yCoeff)
            make.leading.equalTo(profileImage.snp.trailing).offset(16 * Constraint.xCoeff)
            make.bottom.equalToSuperview()
            make.height.equalTo(16 * Constraint.yCoeff)
        }
        
        favoriteImage.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-24 * Constraint.xCoeff)
            make.width.height.equalTo(32 * Constraint.xCoeff)
        }
    }
}
