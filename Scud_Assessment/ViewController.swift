//
//  ViewController.swift
//  Scud_Assessment
//
//  Created by ADMIN on 3/7/23.
//

import UIKit


fileprivate extension ViewController {
    func  getNoticeBoard() -> UIView {
        let icon = UIImageView()
        icon.backgroundColor = .red
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NB: if you complete at least 80% daily, you will be paid the said amount for that day,"
        label.numberOfLines = 3
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(icon)
        content.addSubview(label)
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 8),
            icon.topAnchor.constraint(equalTo: content.topAnchor, constant: 3),
            icon.heightAnchor.constraint(equalToConstant: 17.5),
            icon.widthAnchor.constraint(equalToConstant: 17.5)
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: icon.topAnchor),
            label.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])
        
        return content
    }
}

final class ViewController: UIViewController {
    private let contentMargin: CGFloat = 16
    
    fileprivate lazy var noticeBoardView: UIView = {
        let view = getNoticeBoard()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var trackerIndicatorView: UIView = {
        let tracker = UIView()
        tracker.backgroundColor = .green
        tracker.translatesAutoresizingMaskIntoConstraints = false
        return tracker
    }()
    
    fileprivate lazy var timeStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .brown
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    fileprivate lazy var tripsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .red
        return table
    }()
    
    fileprivate lazy var contentStackView: UIStackView = {
        let stack = UIStackView.init(arrangedSubviews: [noticeBoardView, trackerIndicatorView, timeStackView, tripsTableView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.axis = .vertical
        stack.distribution = .fill
        
        noticeBoardView.heightAnchor.constraint(equalToConstant: 41).isActive = true
        trackerIndicatorView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeStackView.heightAnchor.constraint(equalToConstant: 138).isActive = true
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIs()
    }
    
    private func setupUIs() {
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: contentMargin),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -contentMargin)
        ])
    }
}
