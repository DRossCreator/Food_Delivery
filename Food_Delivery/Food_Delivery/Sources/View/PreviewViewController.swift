//
//  ViewController.swift
//  Food_Delivery
//
//  Created by Daniil Yarkovenko on 25.08.2022.
//

import UIKit

class PreviewViewController: UIViewController {

    //Views

    private lazy var logoBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "brand.logo")
        imageView.layer.cornerRadius = Metric.logoBackgroundWidth / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var previewLabel: UILabel = {
        let label = UILabel()
        label.text = "Food for \nEveryone"
        label.numberOfLines = 2
        label.font = UIFont(name: "SFProRounded-Heavy", size: 65)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private lazy var getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get started", for: .normal)
        button.setTitleColor(UIColor.orangeBackground, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = Metric.getStartedButtonHeight / 2
        button.addTarget(self, action: #selector(startTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var firstPerson: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "person.first")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var secondPerson: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "person.second")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHieracly()
        setupLayout()
    }

    //MARK: - Private Functions

    @objc func startTap() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    private func setupView() {
        view.backgroundColor = .orangeBackground

        if Int(GlobalMetric.screenHeight) <= GlobalMetric.iphoneSixScreenHeight {
            firstPerson.isHidden = true
            secondPerson.isHidden = true
        }
    }

    private func setupHieracly() {
        view.addSubview(secondPerson)
        view.addSubview(firstPerson)
        Int(GlobalMetric.screenHeight) > GlobalMetric.iphoneSixScreenHeight ? addGradient() : nil
        view.addSubview(getStartedButton)
        view.addSubview(previewLabel)
        view.addSubview(logoBackground)
    }

    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.6)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.85)
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.orangeBackground.cgColor,
        ]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }

    private func setupLayout() {
        logoBackground.widthAnchor.constraint(equalToConstant: Metric.logoBackgroundWidth).isActive = true
        logoBackground.heightAnchor.constraint(equalToConstant: Metric.logoBackgroundWidth).isActive = true
        logoBackground.leadingAnchor.constraint(equalTo: previewLabel.leadingAnchor).isActive = true
        logoBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true

        previewLabel.topAnchor.constraint(equalTo: logoBackground.bottomAnchor, constant: 20).isActive = true
        previewLabel.widthAnchor.constraint(equalTo: getStartedButton.widthAnchor).isActive = true
        previewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        getStartedButton.heightAnchor.constraint(equalToConstant: Metric.getStartedButtonHeight).isActive = true
        getStartedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.759).isActive = true
        getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true

        firstPerson.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor).isActive = true
        firstPerson.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        secondPerson.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor).isActive = true
        secondPerson.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }


}

extension PreviewViewController {
    enum Metric {
        static let logoBackgroundWidth: CGFloat = 73
        static let getStartedButtonHeight: CGFloat = 70
    }
}

