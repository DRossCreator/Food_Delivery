//
//  ViewController.swift
//  Food_Delivery
//
//  Created by Daniil Yarkovenko on 25.08.2022.
//

import UIKit

class PreviewViewController: UIViewController {

    //Views

    private lazy var logoBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius =
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 255/255, green: 70/255, blue: 10/255, alpha: 1)
    }


}

extension PreviewViewController

