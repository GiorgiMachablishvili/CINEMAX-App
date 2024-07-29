//
//  AccountCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 25.07.24.
//
import UIKit
import SnapKit

class AccountCell: UICollectionViewCell {
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
        view.text = "Account"
        view.font = UIFont.MontserratSemiBold(size: 18)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var memberImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        if let image = UIImage(named: "avatar")?.withRenderingMode(.alwaysTemplate) {
            view.image = image
        }
        view.tintColor = UIColor(hexString: "92929D")
        return view
    }()
    
    private lazy var memberLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Member"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var addButton: UIButton = {
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
    
    private lazy var passwordImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "password")
        return view
    }()
    
    private lazy var passwordLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Change Password"
        view.font = UIFont.MontserratMedium(size: 14)
        view.textColor = UIColor(hexString: "FFFFFF")
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var passwoordButton: UIButton = {
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
        containerView.addSubview(memberImage)
        containerView.addSubview(memberLabel)
        containerView.addSubview(lineImage)
        containerView.addSubview(addButton)
        containerView.addSubview(passwordImage)
        containerView.addSubview(passwordLabel)
        containerView.addSubview(passwoordButton)
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
        
        memberImage.snp.remakeConstraints { make in
            make.top.equalTo(cellLabel.snp.bottom).offset(15 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        memberLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(memberImage.snp.centerY)
            make.leading.equalTo(memberImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        addButton.snp.remakeConstraints { make in
            make.centerY.equalTo(memberLabel.snp.centerY)
            make.trailing.equalTo(containerView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
        
        lineImage.snp.remakeConstraints { make in
            make.top.equalTo(memberImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.trailing.equalTo(containerView.snp.trailing).offset(-24 * Constraint.xCoeff)
            make.height.equalTo(1 * Constraint.yCoeff)
        }
        
        passwordImage.snp.remakeConstraints { make in
            make.top.equalTo(lineImage.snp.bottom).offset(20 * Constraint.yCoeff)
            make.leading.equalTo(containerView.snp.leading).offset(24 * Constraint.xCoeff)
            make.height.width.equalTo(20 * Constraint.yCoeff)
        }
        
        passwordLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(passwordImage.snp.centerY)
            make.leading.equalTo(passwordImage.snp.trailing).offset(22 * Constraint.xCoeff)
            make.trailing.equalTo(containerView.snp.trailing).offset(-18 * Constraint.xCoeff)
            make.height.equalTo(17 * Constraint.yCoeff)
        }
        
        passwoordButton.snp.remakeConstraints { make in
            make.centerY.equalTo(passwordLabel.snp.centerY)
            make.trailing.equalTo(containerView.snp.trailing).offset(-15 * Constraint.xCoeff)
            make.height.width.equalTo(32 * Constraint.yCoeff)
        }
    }
}
