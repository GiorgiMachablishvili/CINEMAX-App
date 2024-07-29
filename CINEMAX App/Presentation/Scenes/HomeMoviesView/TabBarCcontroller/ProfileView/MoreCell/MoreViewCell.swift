//
//  MoreViewCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 29.07.24.
//

import UIKit
import SnapKit

class MoreViewCell: UICollectionViewCell {
    private lazy var moreView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(hexString: "252836").cgColor
        view.layer.borderWidth = 2.0
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var cellLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "More"
        view.font = UIFont.MontserratSemiBold(size: 18)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var legalPoliciesImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        if let image = UIImage(named: "L&P")?.withRenderingMode(.alwaysTemplate) {
            view.image = image
        }
        view.tintColor = UIColor(hexString: "92929D")
        return view
    }()
    
    private lazy var legalPoliciesLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Legal and Policies"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var legalPoliciesButton: UIButton = {
        let view = UIButton(frame: .zero)
        if let image = UIImage(systemName: "chevron.right") {
            view.setImage(image.withTintColor(UIColor(hexString: "12CDD9"), renderingMode: .alwaysOriginal), for: .normal)
        }
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var lineImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Line")
        return view
    }()
    
    private lazy var helpFeedbackImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "H&F")
        return view
    }()
    
    private lazy var helpFeedbackLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Help & Feedback"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var helpFeedbackButton: UIButton = {
        let view = UIButton(frame: .zero)
        if let image = UIImage(systemName: "chevron.right") {
            view.setImage(image.withTintColor(UIColor(hexString: "12CDD9"), renderingMode: .alwaysOriginal), for: .normal)
        }
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var helpFeedbackLine: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Line")
        return view
    }()
    
    private lazy var aboutUsImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "aboutUs")
        return view
    }()
    
    private lazy var aboutUsLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "About Us"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var aboutUsButton: UIButton = {
        let view = UIButton(frame: .zero)
        if let image = UIImage(systemName: "chevron.right") {
            view.setImage(image.withTintColor(UIColor(hexString: "12CDD9"), renderingMode: .alwaysOriginal), for: .normal)
        }
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var aboutUsLine: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Line")
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
        addSubview(moreView)
        moreView.addSubview(cellLabel)
        moreView.addSubview(legalPoliciesImage)
        moreView.addSubview(legalPoliciesLabel)
        moreView.addSubview(lineImage)
        moreView.addSubview(legalPoliciesButton)
        moreView.addSubview(helpFeedbackImage)
        moreView.addSubview(helpFeedbackLabel)
        moreView.addSubview(helpFeedbackButton)
        moreView.addSubview(helpFeedbackLine)
        moreView.addSubview(aboutUsImage)
        moreView.addSubview(aboutUsLabel)
        moreView.addSubview(aboutUsButton)
        moreView.addSubview(aboutUsLine)
    }
    
    private func layout() {
        moreView.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        cellLabel.snp.remakeConstraints { make in
            make.top.equalTo(moreView.snp.top).offset(23 * Constraint.yCoeff)
            make.leading.equalTo(moreView.snp.leading).offset(18 * Constraint.xCoeff)
            make.height.equalTo(22 * Constraint.yCoeff)
        }
        
        legalPoliciesImage.snp.remakeConstraints { make in
            make.top.equalTo(cellLabel.snp.bottom).offset(15 * Constraint.yCoeff)
            make.leading.equalTo(moreView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        legalPoliciesLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(legalPoliciesImage.snp.centerY)
            make.leading.equalTo(legalPoliciesImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        legalPoliciesButton.snp.remakeConstraints { make in
            make.centerY.equalTo(legalPoliciesLabel.snp.centerY)
            make.trailing.equalTo(moreView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
        
        lineImage.snp.remakeConstraints { make in
            make.top.equalTo(legalPoliciesImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(moreView.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(moreView.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(1 * Constraint.yCoeff)
        }
        
        helpFeedbackImage.snp.remakeConstraints { make in
            make.top.equalTo(lineImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(moreView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        helpFeedbackLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(helpFeedbackImage.snp.centerY)
            make.leading.equalTo(helpFeedbackImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.trailing.equalTo(moreView.snp.trailing).offset(-18 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        helpFeedbackButton.snp.remakeConstraints { make in
            make.centerY.equalTo(helpFeedbackLabel.snp.centerY)
            make.trailing.equalTo(moreView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
        
        helpFeedbackLine.snp.remakeConstraints { make in
            make.top.equalTo(helpFeedbackImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(moreView.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(moreView.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(1 * Constraint.yCoeff)
        }
        
        aboutUsImage.snp.remakeConstraints { make in
            make.top.equalTo(helpFeedbackLine.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(moreView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        aboutUsLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(aboutUsImage.snp.centerY)
            make.leading.equalTo(aboutUsImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.trailing.equalTo(moreView.snp.trailing).offset(-18 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        aboutUsButton.snp.remakeConstraints { make in
            make.centerY.equalTo(aboutUsLabel.snp.centerY)
            make.trailing.equalTo(moreView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
        
        aboutUsLine.snp.remakeConstraints { make in
            make.top.equalTo(aboutUsImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(moreView.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(moreView.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(1 * Constraint.yCoeff)
        }
    }
}
