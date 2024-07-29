//
//  LogOutButtonCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 26.07.24.
//

import UIKit
import SnapKit

class LogOutButtonCell: UICollectionViewCell {
    private lazy var logOutButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "logOut"), for: .normal)
        view.layer.cornerRadius = 16
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
        addSubview(logOutButton)
    }
    
    private func layout() {
        logOutButton.snp.remakeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(24 * Constraint.xCoeff)
            make.height.equalTo(50 * Constraint.yCoeff)
        }
    }
}
