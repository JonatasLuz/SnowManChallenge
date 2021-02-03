//
//  UIColorExtension.swift
//  SnowManChallenge
//
//  Created by Jonatas da Luz on 28/01/21.
//
import UIKit

extension UIColor {
    static func darkBlue() -> UIColor {
        return UIColor(red: 18/255, green: 30/255, blue: 152/255, alpha: 1)
    }
    
    static func goldenYellow() -> UIColor {
        return UIColor(red: 254/255, green: 189/255, blue: 44/255, alpha: 1)
    }
    
    static func lightPink() -> UIColor {
        return UIColor(red: 253/255, green: 113/255, blue: 119/255, alpha: 1)
    }
    
    static func lightGreen() -> UIColor {
        return UIColor(red: 77/255, green: 200/255, blue: 168/255, alpha: 1)
    }
    
    static func resolveColorName(colorName: String) -> UIColor {
        switch colorName {
        case "darkBlue":
            return .darkBlue()
        case "goldenYellow":
            return .goldenYellow()
        case "lightGreen":
            return .lightGreen()
        case "lightPink":
            return .lightPink()
        default:
            return .darkBlue()
        }
        
    }
}
