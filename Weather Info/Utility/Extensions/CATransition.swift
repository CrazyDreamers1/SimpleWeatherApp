//
//  CATransition.swift
//  Weather Info
//
//  Created by Izak on 26/3/22.
//

import Foundation
import QuartzCore

extension CATransition{
    
    func navigateFromRight() -> CATransition{
        self.duration = 0.3
        self.type = CATransitionType.push
        self.subtype = CATransitionSubtype.fromRight
        return self
    }
    
    func navigateFromLeft() -> CATransition{
        self.duration = 0.3
        self.type = CATransitionType.push
        self.subtype = CATransitionSubtype.fromLeft
        return self
    }
}
