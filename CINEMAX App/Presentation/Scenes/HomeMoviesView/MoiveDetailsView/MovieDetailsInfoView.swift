//
//  MovieDetailsInfoView.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 29.07.24.
//

import UIKit
import SnapKit

class MovieDetailsInfoView: UIView {
    
    private lazy var infoView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var movieDataLabel: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "data")
        return view
    }()
    
    private lazy var movieDataLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "696974")
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var movieDurationImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Time")
        return view
    }()
    
    private lazy var durationLine: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hexString: "696974")
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var actionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Action"
        view.textColor = UIColor(hexString: "EBEBEF")
        view.font = UIFont(name: "Montserrat-Medium", size: 12)
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
        addSubview(infoView)
        infoView.addSubview(movieDataLabel)
        infoView.addSubview(movieDataLine)
        infoView.addSubview(movieDurationImage)
        infoView.addSubview(durationLine)
        infoView.addSubview(actionLabel)
    }
    
    private func layout() {
        infoView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        movieDataLabel.snp.remakeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(8)
            make.leading.equalTo(infoView.snp.leading).offset(12)
            make.width.equalTo(47)
            make.height.equalTo(16)
        }
        
        movieDataLine.snp.remakeConstraints { make in
            make.centerY.equalTo(movieDataLabel.snp.centerY)
            make.leading.equalTo(movieDataLabel.snp.trailing).offset(12)
            make.width.equalTo(0)
            make.height.equalTo(1)
        }
        
        movieDurationImage.snp.remakeConstraints { make in
            make.top.equalTo(infoView.snp.top).offset(8)
            make.leading.equalTo(movieDataLine.snp.trailing).offset(12)
            make.width.equalTo(94)
            make.height.equalTo(16)
        }
        
        durationLine.snp.remakeConstraints { make in
            make.centerY.equalTo(movieDurationImage.snp.centerY)
            make.leading.equalTo(movieDurationImage.snp.trailing).offset(12)
            make.width.equalTo(0)
            make.height.equalTo(1)
        }
        
        actionLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(movieDurationImage.snp.centerY)
            make.leading.equalTo(durationLine.snp.trailing).offset(12)
            make.width.equalTo(61)
            make.height.equalTo(16)
        }
    }
}
