//
//  HomHeaderView.swift
//  Hooligans
//
//  Created by 정명곤 on 10/18/23.
//

import UIKit
import SnapKit

class MainHeaderView: UIView {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.circle"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainHeaderView {
    private func setupView() {
        self.backgroundColor = UIColor(white: 1, alpha: 0.3)
        
        self.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.width.height.equalTo(30)
        }
        
        self.addSubview(infoButton)
        infoButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.width.height.equalTo(30)
        }
        infoButton.addTarget(self, action: #selector(toLoginView), for: .touchUpInside)
    }
    
    @objc func toLoginView() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.changeRootViewController(SigninController(), animated: false)
        }
    }
}
