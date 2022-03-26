//
//  ViewController.swift
//  Weather Info
//
//  Created by Izak on 14/3/22.
//

import UIKit
import Combine

class HomeVC: UIViewController {
    @IBOutlet private weak var districtNameLbl: UILabel!
    @IBOutlet private weak var temparatureLbl: UILabel!
    @IBOutlet private weak var weatherStateLbl: UILabel!
    @IBOutlet private weak var tempIconImgView: UIImageView!
    @IBOutlet private weak var minTempLbl: UILabel!
    @IBOutlet private weak var maxTempLbl: UILabel!
    @IBOutlet private weak var dateLbl: UILabel!
    
    private let date = Date()
    
    private let homeVM = HomeViewModel()
    private var district:District?
    
    var selectedDistrict = PassthroughSubject<District,Never>()
    private var subscribers = Set<AnyCancellable>()
    
    //MARK: ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialAPICalls()
        self.dataBind()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.initialSetup()
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
}

//MARK: IBActions
extension HomeVC{
    @IBAction func districtPickerPressed(_ sender: UIButton) {
        let vc = DistrictListVC.instantiate(storyboard: .home)
        vc.passDistrictDelegate = self
        self.navigationController?.view.layer.add(CATransition().navigateFromLeft(), forKey: kCATransition)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func detailsBtnPressed(_ sender: UIButton) {
        let vc = DistrictDetailVC.instantiate(storyboard: .home)
        vc.district = self.district
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

//MARK: Custom Method
extension HomeVC{
    
    private func initialAPICalls() {
        self.homeVM.getWeatherInfo(lat: "23.8105", lon: "90.3372")
    }
    
    private func dataBind() {
        self.homeVM.$currentWeatherInfo.sink { weather in
            self.temparatureLbl.text = "\(weather?.main?.temp ?? 0.0)".tempurature()
            self.weatherStateLbl.text = weather?.weather?.first?.main ?? ""
            self.minTempLbl.text = "\(weather?.main?.temp_min ?? 0.0)".tempurature()
            self.maxTempLbl.text = "\(weather?.main?.temp_max ?? 0.0)".tempurature()
            
        }.store(in: &subscribers)
    }
    
    private func initialSetup() {
        self.dateLbl.text = self.date.getFormattedDate()
    }
}

//MARK: PassDistrictDelegate method implement
extension HomeVC:PassDistrictDelegate{
    func selectedDistrict(district: District) {
        let coordinate = district.coordinates?.makeCoordinate()
        self.districtNameLbl.text = district.getName()
        self.district = district
        self.homeVM.getWeatherInfo(lat: coordinate?.lat ?? "23.8105", lon: coordinate?.lon ?? "90.3372")
    }
    
    
}
