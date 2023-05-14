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
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let firstBottomLabel: UILabel = {
        let label = UILabel()
        label.text = "desc1"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let secondTopLabel: UILabel = {
        let label = UILabel()
        label.text = "title2"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let secondBottomLabel: UILabel = {
        let label = UILabel()
        label.text = "desc2"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
//        setupAccessibilityLabel()
        setupAccessibilityLabel2()
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

    private func setupAccessibilityLabel() {
        var elements = [Any]()
        
        elements.append(firstTopLabel)
        elements.append(firstBottomLabel)
        
        elements.append(secondTopLabel)
        elements.append(secondBottomLabel)
        
        accessibilityElements = elements
    }
    
    private func setupAccessibilityLabel2() {
        var elements = [Any]()
        
        let group1 = UIAccessibilityElement(accessibilityContainer: self)
        group1.accessibilityLabel = "\(firstTopLabel.text!), \(firstBottomLabel.text!)"
        group1.accessibilityFrameInContainerSpace = firstTopLabel.frame.union(firstBottomLabel.frame)
        
        elements.append(group1)
        elements.append(firstTopLabel)
        elements.append(firstBottomLabel)
        
        let group2 = UIAccessibilityElement(accessibilityContainer: self)
        group2.accessibilityLabel = "\(secondTopLabel.text!), \(secondBottomLabel.text!)"
        group2.accessibilityFrameInContainerSpace = secondTopLabel.frame.union(secondBottomLabel.frame)

        elements.append(group2)
        elements.append(secondTopLabel)
        elements.append(secondBottomLabel)
        
        accessibilityElements = elements
    }
}
