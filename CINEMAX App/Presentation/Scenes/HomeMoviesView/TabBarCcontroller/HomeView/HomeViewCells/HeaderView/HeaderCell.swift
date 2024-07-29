//
//  HeaderCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 23.07.24.
//

import UIKit
import SnapKit

class HeaderCell: UICollectionViewCell {
    let headerView = HeaderView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(headerView)
    }
    
    private func layout() {
        headerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
