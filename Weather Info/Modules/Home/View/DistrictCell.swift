//
//  DistrictCell.swift
//  Weather Info
//
//  Created by Izak on 16/3/22.
//

import UIKit

class DistrictCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    func configureCell(district:District) {
        self.bgView.layer.cornerRadius = 4
        self.bgView.clipsToBounds = true
        self.name.text = district.district
    
    }
    
}
