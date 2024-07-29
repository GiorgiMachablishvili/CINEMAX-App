//
//  MoreCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 26.07.24.
//

import UIKit
import SnapKit

class MoreCell: UICollectionViewCell {
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = UIColor(hexString: "92929D")
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.textColor = UIColor(hexString: "92929D")
        return view
    }()
    
    private lazy var chevronButton: UIButton = {
        let view = UIButton(type: .system)
        view.tintColor = UIColor.systemTeal
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
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(chevronButton)
    }
    
    private func layout() {
        iconImageView.snp.remakeConstraints { make in
            make.top.equalTo(snp.bottom)
            make.leading.equalTo(snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.leading.equalTo(iconImageView.snp.trailing).offset(22 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        chevronButton.snp.remakeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
    }
    
    func configure(with data: ProfileGroupData) {
        iconImageView.image = data.notificationCellImage
        titleLabel.text = data.title
        chevronButton.setImage(data.button.withTintColor(UIColor(hexString: "12CDD9"), renderingMode: .alwaysOriginal), for: .normal)
    }
}

