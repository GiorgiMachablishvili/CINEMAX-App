//
//  RaitingView.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 25.07.24.
//

import UIKit
import SnapKit

class RatingView: UIView {
    private lazy var raitingView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear.withAlphaComponent(0.5)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var raitingLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.layer.cornerRadius = 10
        view.textColor = UIColor(hexString: "FF8700")
        view.font = UIFont.MontserratBold(size: 12)
        return view
    }()
    
    private lazy var raitingStar: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "star")
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
        addSubview(raitingView)
        raitingView.addSubview(raitingLabel)
        raitingView.addSubview(raitingStar)
    }
    
    private func layout() {
        raitingView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        raitingStar.snp.remakeConstraints { make in
            make.centerY.equalTo(raitingView.snp.centerY)
            make.leading.equalTo(raitingView.snp.leading).offset(8 * Constraint.xCoeff)
            make.width.height.equalTo(16 * Constraint.xCoeff)
        }
        
        raitingLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(raitingView.snp.centerY)
            make.leading.equalTo(raitingStar.snp.trailing).offset(4 * Constraint.xCoeff)
            make.height.equalTo(15 * Constraint.yCoeff)
        }
    }
    
    func setRaiting(_ raiting: Double) {
            raitingLabel.text = "\(raiting)"
        }
}
