//
//  UserInfoView.swift
//  Hooligans
//
//  Created by 진우's MAC book on 2023/09/23.
//

import UIKit

class UserInfoView: UIView {
    static let identifiter = "UserInfoView"
    
    let label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(origin: .zero, size: .zero)
        label.text = "asdf"
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {                //. 공부하기
        super.init(frame: frame)
        setupview()
    }
    
    required init?(coder: NSCoder) {                //
        fatalError("init(coder:) has not been implemented")
    }
}


extension UserInfoView {
    private func setupview() {
        
        addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true                        // 공부하기
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true                //
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
}
