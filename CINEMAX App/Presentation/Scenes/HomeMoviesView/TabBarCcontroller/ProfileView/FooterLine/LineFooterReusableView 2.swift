//
//  LineFooterReusableView.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 28.07.24.
//

import UIKit
import SnapKit

class LineFooterReusableView: UICollectionReusableView {
    static let reuseIdentifier = "LineFooterReusableView"
    
    private lazy var footerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "252836")
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
        addSubview(footerView)
    }
    
    private func layout() {
        footerView.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(266)
        }
    }
}
