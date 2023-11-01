//
//  WebViewController.swift
//  Hooligans
//
//  Created by 정명곤 on 10/29/23.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    
    private var webView: WKWebView?
    private var url: String?
    
    private let exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:  "x.circle"), for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    init(base: String, query: String) {
        super.init(nibName: nil, bundle: nil)
        self.url = base + query
                        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        // Initialize WKWebView
        webView = WKWebView()
        webView?.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let targetUrl = self.url else { return }
        print(targetUrl)
        if let url = URL(string: targetUrl) {
            let request = URLRequest(url: url)
            webView?.load(request)
        }
        // Do any additional setup after loading the view.
    }
    
}

extension WebViewController {
    func setupView() {
        self.view.backgroundColor = .white
        
        view.addSubview(exitButton)
        exitButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        exitButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.width.height.equalTo(50)
        }
        
//        view.addSubview(webView ?? UIView())
//        webView?.snp.makeConstraints { make in
//            make.top.equalTo(exitButton.snp.bottom)
//            make.leading.trailing.bottom.equalToSuperview()
//        }
        
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
}

extension WebViewController: WKNavigationDelegate {
    
}
