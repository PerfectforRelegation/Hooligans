//
//  UIViewExtention.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import UIKit
import Combine

//extension UIView {
//
//    private func layoutInit() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.frame = CGRect(origin: .zero, size: .zero)
//    }
//
//}
//
//extension UIButton {
//
//    func layoutInit() -> UIButton {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.frame = CGRect(origin: .zero, size: .zero)
//        return self
//    }
//}
//
//extension UITableView {
//
//    func layoutInit() -> UITableView {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.frame = CGRect(origin: .zero, size: .zero)
//        return self
//    }
//}
var cancellables = Set<AnyCancellable>()

class ImageLoader {
    let network = NetworkService(session: URLSession.shared)
    
    func load(url: String, completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let urlRequest = RequestBuilder(url: url, body: nil, headers: nil).create()
        
        guard let request = urlRequest else { return }
        
        network.request()
            .receive(on: DispatchQueue.main)
            .sink { result in
                print("recieve")
            } receiveValue: { [weak self] image in
                completion(image)
            }
            .store(in: &cancellables)
    }
}
