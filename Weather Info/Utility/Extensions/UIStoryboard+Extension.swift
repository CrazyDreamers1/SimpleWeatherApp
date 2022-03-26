//
//  UIStoryboard+Extension.swift
//  Weather BD
//
//  Created by Izak on 14/3/22.
//


import UIKit

extension UIStoryboard {
    //  If there are multiple storyboards in the project, each one must be named here:
    enum Storyboard: String {
        case home = "Home"
     }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
}
