//
//  Font.swift
//  Hooligans
//
//  Created by 정명곤 on 11/6/23.
//

import UIKit

enum Font: String {
    case Black = "NotoSansKR-Black"
    case Bold = "NotoSansKR-Bold"
    case SemiBold = "NotoSansKR-SemiBold"
    case Medium = "NotoSansKR-Medium"
    case Regular = "NotoSansKR-Regular"
    case Light = "NotoSansKR-Light"
    case Thin = "NotoSansKR-Thin"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont()
    }
    
    static func black(size: CGFloat) -> UIFont {
        return Font.Black.of(size: size)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return Font.Bold.of(size: size)
    }
    
    static func semibold(size: CGFloat) -> UIFont {
        return Font.SemiBold.of(size: size)
    }
    
    static func medium(size: CGFloat) -> UIFont {
        return Font.Medium.of(size: size)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return Font.Regular.of(size: size)
    }
    
    static func light(size: CGFloat) -> UIFont {
        return Font.Light.of(size: size)
    }
    
    static func thin(size: CGFloat) -> UIFont {
        return Font.Thin.of(size: size)
    }

}
