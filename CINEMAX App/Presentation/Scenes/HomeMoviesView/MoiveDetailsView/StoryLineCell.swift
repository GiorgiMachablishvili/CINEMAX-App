//
//  StoryLineCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 29.07.24.
//

import UIKit
import SnapKit

class StoryLineCell: UICollectionViewCell {
    private lazy var storyView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var storyLineTitleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.font = UIFont.MontserratSemiBold(size: 16)
        view.text = "Story Line"
        view.textAlignment = .left
        return view
    }()
    
    private lazy var storyLineLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = UIColor(hexString: "EBEBEF")
        view.font = UIFont.MontserratRegular(size: 14)
        view.textAlignment = .left
        view.numberOfLines = 5
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
        addSubview(storyView)
        storyView.addSubview(storyLineTitleLabel)
        storyView.addSubview(storyLineLabel)
    }
    
    private func layout() {
        storyView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        storyLineTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(storyView.snp.top).offset(19)
            make.leading.equalTo(storyView.snp.leading).offset(24)
            make.height.equalTo(20)
        }
        
        storyLineLabel.snp.remakeConstraints { make in
            make.top.equalTo(storyLineTitleLabel.snp.bottom)
            make.leading.equalTo(storyView.snp.leading).offset(24)
            make.trailing.equalTo(storyView.snp.trailing).inset(24)
            make.height.equalTo(102)
        }
    }
    
    func configure(with data: MovieData) {
        storyLineLabel.text = data.overview
    }
}
