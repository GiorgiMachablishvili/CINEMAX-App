//
//  GeneralViewHeaderReusableView.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 26.07.24.
//

import UIKit
import SnapKit

class GeneralViewHeaderReusableView: UICollectionReusableView {
    static let reuseIdentifier = "GeneralViewHeaderReusableView"
    
    private lazy var categoryLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "General"
        view.font = UIFont.MontserratSemiBold(size: 18)
        view.textColor = UIColor(hexString: "FFFFFF")
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
            make.leading.equalTo(snp.leading).offset(18 * Constraint.xCoeff)
            make.top.equalTo(snp.top).offset(23 * Constraint.yCoeff)
            make.height.equalTo(22 * Constraint.yCoeff)
        }
    }
}
