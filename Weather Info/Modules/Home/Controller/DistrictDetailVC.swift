//
//  DistrictDetailVC.swift
//  Weather Info
//
//  Created by Izak on 16/3/22.
//

import UIKit

class DistrictDetailVC: UIViewController {

    @IBOutlet private weak var districtNameLbl: UILabel!
    @IBOutlet private weak var districtBnNameLbl: UILabel!
    @IBOutlet private weak var districtDescriptionLbl: UITextView!
    
    var district:District?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.initialSetup()
    }
    
    private func initialSetup() {
        let name = self.district?.district ?? "Dhaka"
        let nameBN = self.district?.districtbn ?? "ঢাকা"
        self.districtNameLbl.text = name
        self.districtBnNameLbl.text = nameBN
        self.districtDescriptionLbl.text = district?.districtDescription()
    }
    
    @IBAction func crossBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
