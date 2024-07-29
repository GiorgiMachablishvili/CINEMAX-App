//
//  SearchBarCell.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 23.07.24.
//

import UIKit
import SnapKit

class SearchBarCell: UICollectionViewCell, UISearchBarDelegate {
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Searc a title.."
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(hexString: "1F1D2B")
        view.searchBarStyle = .minimal
        
        if let textField = view.value(forKey: "searchField") as? UITextField {
            textField.attributedPlaceholder = NSAttributedString(
                string: "Search a title..",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "92929D")]
            )
            if let leftView = textField.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor(hexString: "92929D")
            }
        }
        view.delegate = self
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
        addSubview(searchBar)
    }
    
    private func layout() {
        searchBar.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
}
