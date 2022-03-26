//
//  NSObject+Extension.swift
//  Weather BD
//
//  Created by Izak on 14/3/22.
//

import Foundation

extension NSObject{
    class var nameOfClass: String{
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    var nameOfClass: String{
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}
