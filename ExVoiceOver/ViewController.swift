//
//  ViewController.swift
//  ExVoiceOver
//
//  Created by 김종권 on 2023/05/11.
//

import UIKit

class ViewController: UIViewController {
    private let firstTopLabel: UILabel = {
        let label = UILabel()
        label.text = "title1"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let firstBottomLabel: UILabel = {
        let label = UILabel()
        label.text = "desk1"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let secondTopLabel: UILabel = {
        let label = UILabel()
        label.text = "title2"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let secondBottomLabel: UILabel = {
        let label = UILabel()
        label.text = "desc2"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupAccessibilityLabel1()
    }
    
    private func setupLayout() {
        view.addSubview(firstTopLabel)
        view.addSubview(firstBottomLabel)
        view.addSubview(secondTopLabel)
        view.addSubview(secondBottomLabel)

        NSLayoutConstraint.activate([
            firstTopLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            firstTopLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstBottomLabel.topAnchor.constraint(equalTo: firstTopLabel.bottomAnchor),
            firstBottomLabel.leadingAnchor.constraint(equalTo: firstTopLabel.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            secondTopLabel.topAnchor.constraint(equalTo: firstTopLabel.topAnchor),
            secondTopLabel.leadingAnchor.constraint(equalTo: firstTopLabel.trailingAnchor, constant: 16),
            secondBottomLabel.topAnchor.constraint(equalTo: secondTopLabel.bottomAnchor),
            secondBottomLabel.leadingAnchor.constraint(equalTo: secondTopLabel.leadingAnchor),
        ])
    }

    private func setupAccessibilityLabel1() {
        secondTopLabel.accessibilityLabel = "title: \(secondTopLabel.text!)"
        secondTopLabel.accessibilityHint = "This is title of app1"
        secondTopLabel.accessibilityLabel = "title: \(secondTopLabel.text!)"
        secondTopLabel.accessibilityHint = "This is title of app2"
    }
}
