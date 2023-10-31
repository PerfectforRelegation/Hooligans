//
//  LaunchScreenViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 10/30/23.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        let gif = UIImage.gifImageWithName("siu")
        imageView.contentMode = .scaleAspectFill
        imageView.image = gif
        return imageView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension LaunchScreenViewController {
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
