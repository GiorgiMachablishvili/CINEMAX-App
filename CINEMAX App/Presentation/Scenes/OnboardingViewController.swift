//
//  ViewController.swift
//  CINEMAX App
//
//  Created by Gio's Mac on 20.07.24.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    private var dataSource: OnboardingDataSource?
    private var viewModel: OnboardingViewModelProtocol?
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        configureDataSource()
    }
    
    private func setup() {
        view.addSubview(tableView)
    }
    
    private func layout() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureDataSource() {
        guard let viewModel else { return }
        dataSource = OnboardingDataSource(tableView: tableView, viewModel: viewModel)
    }
}

