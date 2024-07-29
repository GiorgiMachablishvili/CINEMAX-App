//
//  PopularMoviesReusableView.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 25.07.24.
//

import UIKit
import SnapKit

class PopularMoviesReusableView: UICollectionReusableView {
    static let reuseIdentifier = "PopularMoviesReusableView"
    
    private lazy var categoryLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Most popular"
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.MontserratBold(size: 16)
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var seeButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("See All", for: .normal)
        view.setTitleColor(UIColor(hexString: "12CDD9"), for: .normal)
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
        addSubview(categoryLabel)
        addSubview(seeButton)
    }
    
    private func layout() {
        categoryLabel.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(23 * Constraint.xCoeff)
            make.centerY.equalTo(snp.centerY)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
        
        seeButton.snp.remakeConstraints { make in
            make.trailing.equalTo(snp.trailing).offset(-24 * Constraint.xCoeff)
            make.centerY.equalTo(categoryLabel.snp.centerY)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
    }
}


