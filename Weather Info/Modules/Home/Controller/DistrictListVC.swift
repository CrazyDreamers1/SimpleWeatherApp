//
//  DistrictListVC.swift
//  Weather Info
//
//  Created by Izak on 16/3/22.
//

import UIKit
import Combine

protocol PassDistrictDelegate {
    func selectedDistrict(district:District) -> Void
}

class DistrictListVC: UIViewController {
    @IBOutlet weak var districtTblView: UITableView!
    @IBOutlet weak var districtHolderView: UIView!
    @IBOutlet weak var tuchRecView: UIView!
    
    private var subscribers = Set<AnyCancellable>()
    var passDistrictDelegate:PassDistrictDelegate!
    
    let homeVM = HomeViewModel()
    var districts:[District] = []
    
    
    //ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTaptoMainView()
        self.homeVM.getDistrictList()
        self.bindData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.style()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    //Action methods
    @IBAction func crossBtnPressed(_ sender: UIButton) {
        self.dismissCurrentView()
    }

}

//MARK: - Custom functions
extension DistrictListVC{
    
    private func bindData() {
        homeVM.$districtList.sink { districts in
            self.districts = districts
            self.districtTblView.reloadData()
        }.store(in: &subscribers)
    }
    
    private  func style() {
        self.navigationController?.navigationBar.isHidden = true
        districtHolderView.layer.cornerRadius = 5
        districtHolderView.clipsToBounds = true
    }
    
    private func addTaptoMainView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedToView))
        self.tuchRecView.isUserInteractionEnabled = true
        self.tuchRecView.addGestureRecognizer(tap)
    }
    
    @objc private func tappedToView() {
        self.dismissCurrentView()
    }
    
    private func dismissCurrentView() {
        self.navigationController?.view.layer.add(CATransition().navigateFromRight(), forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
    }
}

//MARK: - TableView DataSource
extension DistrictListVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DistrictCell") as? DistrictCell else{
            return UITableViewCell()
        }
        
        cell.configureCell(district: self.districts[indexPath.row])
        return cell
    }
    
    
}

//MARK: - TableView Delegate
extension DistrictListVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passDistrictDelegate.selectedDistrict(district: self.districts[indexPath.row])
        self.dismissCurrentView()
    }
}
