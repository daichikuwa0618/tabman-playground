//
//  ParentViewController.swift
//  TabmanPlayground
//
//  Created by Daichi Hayashi on 2022/02/10.
//

import UIKit

class ParentViewController: UIViewController {

    private let label = UILabel()
    private let tabVC = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isTranslucent = false
        setup()
    }

    private func setup() {
        // Label
        label.text = "Upper View"
        label.backgroundColor = .yellow
        label.textAlignment = .center

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 24),
        ])

        // TabVC
        addChild(tabVC)
        view.addSubview(tabVC.view)
        tabVC.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tabVC.view.topAnchor.constraint(equalTo: label.bottomAnchor),
            tabVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
