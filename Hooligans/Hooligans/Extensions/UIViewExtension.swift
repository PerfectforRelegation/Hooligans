//
//  UIViewExtention.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/19.
//

import UIKit

protocol Styleable {}

extension UIView: Styleable {}

extension Styleable where Self: UIView {
    @discardableResult
    func cornerRadius(_ value: CGFloat) -> Self {
        self.layer.cornerRadius = value
        
        return self
    }
    
    @discardableResult
    func backgroundColor(_ value: UIColor) -> Self {
        self.backgroundColor = value
        
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ value: Bool) -> Self {
        self.clipsToBounds = value
        
        return self
    }
    
    @discardableResult
    func contentMode(_ value: UIView.ContentMode) -> Self {
        self.contentMode = value
        
        return self
    }
    
    @discardableResult
    func isHidden(_ value: Bool) -> Self {
        self.isHidden = value
        
        return self
    }
}

extension Styleable where Self: UIImageView {
    @discardableResult
    func cornerRadius(_ value: CGFloat) -> Self {
        self.layer.cornerRadius = value
        
        return self
    }
    
    @discardableResult
    func backgroundColor(_ value: UIColor) -> Self {
        self.backgroundColor = value
        
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ value: Bool) -> Self {
        self.clipsToBounds = value
        
        return self
    }
    
    @discardableResult
    func contentMode(_ value: UIView.ContentMode) -> Self {
        self.contentMode = value
        
        return self
    }
    
    @discardableResult
    func isHidden(_ value: Bool) -> Self {
        self.isHidden = value
        
        return self
    }
    
    @discardableResult
    func opacity(_ value: Float) -> Self {
        self.layer.opacity = value
        
        return self
    }
    
    @discardableResult
    func masksToBounds(_ value: Bool) -> Self {
        self.layer.masksToBounds = value
        
        return self
    }
    
}
