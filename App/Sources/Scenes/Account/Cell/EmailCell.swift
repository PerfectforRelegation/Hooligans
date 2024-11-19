//
//  EmailCell.swift
//  Hooligans
//
//  Created by 정명곤 on 11/6/23.
//

import UIKit

protocol EmailCellDelegate: AnyObject {
    func textFieldTextDidEndEditing(email: String, password: String)
}

final class EmailCell: UICollectionViewCell {
    static let identifier = "emailCell"
    weak var delegate: EmailCellDelegate?
    
    private let emailTextField = TextField(fieldType: .email)
    private let passwordTextField = TextField(fieldType: .password)
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
//        button.titleLabel?.font = Font.semibold(size: 16)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        emailTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EmailCell {
    private func setupView() {
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(56)
        }
        
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(56)
        }
        
        addSubview(continueButton)
        continueButton.addTarget(self, action: #selector(tabSigninButton), for: .touchUpInside)
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(56)
        }
    }
    
    @objc func tabSigninButton() {
        textFieldTextDidEndEditing(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}

extension EmailCell: EmailCellDelegate, UITextFieldDelegate {
    func textFieldTextDidEndEditing(email: String, password: String) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            delegate?.textFieldTextDidEndEditing(email: email, password: password)
        }
    }
    
}
