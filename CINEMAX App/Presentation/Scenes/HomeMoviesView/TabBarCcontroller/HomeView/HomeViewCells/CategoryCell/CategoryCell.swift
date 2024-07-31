//
//  CategoryCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 23.07.24.
//

import UIKit
import SnapKit

class CategoryCell: UICollectionViewCell {
    
    var cellData : CategoryButtonData? {
        didSet {
            guard let cellData else { return }
            categoryButtonTitle.text = cellData.buttonName
            updateAppearance(isSelected: cellData.isSelected)
        }
    }
    
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 5
        return view
    }()
    
    private lazy var categoryButtonTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .center
        view.textColor = UIColor(hexString: "EBEBEF")
        view.font = UIFont.MontserratMedium(size: 12)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
//        addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(shadowView)
        shadowView.addSubview(categoryButtonTitle)
    }
    
    private func layout() {
        
        
        shadowView.snp.remakeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        categoryButtonTitle.snp.remakeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
//            make.height.equalTo(15 * Constraint.yCoeff)
        }
    }
    
//    private func addTapGesture() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        self.addGestureRecognizer(tapGesture)
//    }
    
//    @objc private func handleTap() {
//        self.isSelected.toggle()
//        updateAppearance()
//    }
    
    private func updateAppearance(isSelected: Bool) {
        if isSelected {
            categoryButtonTitle.textColor = UIColor(hexString: "12CDD9")
            shadowView.backgroundColor = UIColor(hexString: "252836")
        } else {
            categoryButtonTitle.textColor = UIColor(hexString: "EBEBEF")
            shadowView.backgroundColor = .clear
        }
    }
    
//    override var isSelected: Bool {
//        didSet {
//            updateAppearance()
//        }
//    }
}
