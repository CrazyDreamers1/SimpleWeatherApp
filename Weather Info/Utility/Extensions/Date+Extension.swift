//
//  Date+Extension.swift
//  Weather Info
//
//  Created by Izak on 17/3/22.
//

import Foundation

extension Date {
   func getFormattedDate() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "EEEE, MMM d, yyyy"
        return dateformat.string(from: self)
    }
}
