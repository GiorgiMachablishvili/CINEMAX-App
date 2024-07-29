//
//  GeneralCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 28.07.24.
//

import UIKit
import SnapKit

class GeneralCell: UICollectionViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(hexString: "252836").cgColor
        view.layer.borderWidth = 2.0
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var cellLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "General"
        view.font = UIFont.MontserratSemiBold(size: 18)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var notificationImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        if let image = UIImage(named: "notification")?.withRenderingMode(.alwaysTemplate) {
            view.image = image
        }
        view.tintColor = UIColor(hexString: "92929D")
        return view
    }()
    
    private lazy var notificationLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Notification"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var notificationButton: UIButton = {
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
    
    private lazy var languageImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "language")
        return view
    }()
    
    private lazy var languageLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Language"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var languageButton: UIButton = {
        let view = UIButton(frame: .zero)
        if let image = UIImage(systemName: "chevron.right") {
            view.setImage(image.withTintColor(UIColor(hexString: "12CDD9"), renderingMode: .alwaysOriginal), for: .normal)
        }
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var languageLine: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Line")
        return view
    }()
    
    private lazy var countryImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "country")
        return view
    }()
    
    private lazy var countryLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Country"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var countryButton: UIButton = {
        let view = UIButton(frame: .zero)
        if let image = UIImage(systemName: "chevron.right") {
            view.setImage(image.withTintColor(UIColor(hexString: "12CDD9"), renderingMode: .alwaysOriginal), for: .normal)
        }
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var countryLine: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "Line")
        return view
    }()
    
    private lazy var clearImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "clear")
        return view
    }()
    
    private lazy var clearLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Clear Cache"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var clearButton: UIButton = {
        let view = UIButton(frame: .zero)
        if let image = UIImage(systemName: "chevron.right") {
            view.setImage(image.withTintColor(UIColor(hexString: "12CDD9"), renderingMode: .alwaysOriginal), for: .normal)
        }
        view.backgroundColor = .clear
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
        addSubview(containerView)
        containerView.addSubview(cellLabel)
        containerView.addSubview(notificationImage)
        containerView.addSubview(notificationLabel)
        containerView.addSubview(lineImage)
        containerView.addSubview(notificationButton)
        containerView.addSubview(languageImage)
        containerView.addSubview(languageLabel)
        containerView.addSubview(languageButton)
        containerView.addSubview(languageLine)
        containerView.addSubview(countryImage)
        containerView.addSubview(countryLabel)
        containerView.addSubview(countryButton)
        containerView.addSubview(countryLine)
        containerView.addSubview(clearImage)
        containerView.addSubview(clearLabel)
        containerView.addSubview(clearButton)
    }
    
    private func layout() {
        containerView.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        cellLabel.snp.remakeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(23 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(18 * Constraint.xCoeff)
            make.height.equalTo(22 * Constraint.yCoeff)
        }
        
        notificationImage.snp.remakeConstraints { make in
            make.top.equalTo(cellLabel.snp.bottom).offset(15 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        notificationLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(notificationImage.snp.centerY)
            make.leading.equalTo(notificationImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        notificationButton.snp.remakeConstraints { make in
            make.centerY.equalTo(notificationLabel.snp.centerY)
            make.trailing.equalTo(containerView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
        
        lineImage.snp.remakeConstraints { make in
            make.top.equalTo(notificationImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(containerView.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(1 * Constraint.yCoeff)
        }
        
        languageImage.snp.remakeConstraints { make in
            make.top.equalTo(lineImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        languageLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(languageImage.snp.centerY)
            make.leading.equalTo(languageImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.trailing.equalTo(containerView.snp.trailing).offset(-18 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        languageButton.snp.remakeConstraints { make in
            make.centerY.equalTo(languageLabel.snp.centerY)
            make.trailing.equalTo(containerView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
        
        languageLine.snp.remakeConstraints { make in
            make.top.equalTo(languageImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(containerView.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(1 * Constraint.yCoeff)
        }
        
        countryImage.snp.remakeConstraints { make in
            make.top.equalTo(languageLine.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        countryLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(countryImage.snp.centerY)
            make.leading.equalTo(countryImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.trailing.equalTo(containerView.snp.trailing).offset(-18 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        countryButton.snp.remakeConstraints { make in
            make.centerY.equalTo(countryLabel.snp.centerY)
            make.trailing.equalTo(containerView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
        
        countryLine.snp.remakeConstraints { make in
            make.top.equalTo(countryImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(containerView.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(1 * Constraint.yCoeff)
        }
        
        clearImage.snp.remakeConstraints { make in
            make.top.equalTo(countryLine.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        clearLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(clearImage.snp.centerY)
            make.leading.equalTo(clearImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.trailing.equalTo(containerView.snp.trailing).offset(-18 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        clearButton.snp.remakeConstraints { make in
            make.centerY.equalTo(clearLabel.snp.centerY)
            make.trailing.equalTo(containerView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
    }
}

