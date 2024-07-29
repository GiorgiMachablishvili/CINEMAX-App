//
//  CategoryHeaderView.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 24.07.24.
//

import UIKit
import SnapKit

class CategoryHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "CategoryHeaderView"
    
    private lazy var categoryLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Categories"
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.MontserratBold(size: 16)
        view.textAlignment = .left
        view.numberOfLines = 1
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
    }
    
    private func layout() {
        categoryLabel.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(23 * Constraint.xCoeff)
            make.top.equalTo(snp.top).offset(30 * Constraint.yCoeff)
            make.height.equalTo(20 * Constraint.yCoeff)
        }
    }
}
