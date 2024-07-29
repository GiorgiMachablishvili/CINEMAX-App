//
//  PremiumMemberCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 25.07.24.
//

import UIKit
import SnapKit

class PremiumMemberCell: UICollectionViewCell {
    private lazy var memberImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Banner")
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
        addSubview(memberImage)
    }
    
    private func layout() {
        memberImage.snp.remakeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
