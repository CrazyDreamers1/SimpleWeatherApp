//
//  AppConstant.swift
//  Urjas Departmental
//
//  Created by MPPKVVCL on 21/09/20.
//  Copyright © 2020 MPPKVVCL. All rights reserved.
//

import Foundation
import SystemConfiguration
import Alamofire
import MBProgressHUD
import Reachability
import UIKit




class AppConstant{
    static let shared:AppConstant = AppConstant()
     let OPEN_WEATHER_API_KEY = "2fad9fa86dd51ba8c17df8a1c4a94dcf"
}

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}


//Show alert toast
func showAlert(message: String) {
    
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.view.tintColor = UIColor.init(named: "C9352D")
    alert.addAction(OKAction)
    getWindow().rootViewController?.present(alert, animated: true, completion: nil)
}



//MARK: - Show/Hide HudView(loader)
func showHudWithTitle(title:String?){

    let loadingNotification = MBProgressHUD.showAdded(to: getWindow(), animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.label.text =  title!
    //loadingNotification.label.textColor = UIColor.orange
    loadingNotification.alpha = 1.0
}

func showHud(){
    let loadingNotification = MBProgressHUD.showAdded(to: getWindow(), animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.label.text =  "Please wait.."
    //loadingNotification.label.textColor = UIColor.orange
    loadingNotification.alpha = 1.0
}

func hideHud(){
    DispatchQueue.main.async {
        MBProgressHUD.hide(for:getWindow(), animated: true)
    }
}


func getWindow()->UIWindow
{
    var window: UIWindow? {
        if #available(iOS 13, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
                   return window
        }
        
        return window
    }
    
    if let w = window
    {
        return w
    }
    return UIWindow()
}

func getGifData()->Data
{
    let path = Bundle.main.path(forResource: "emptycart", ofType: "gif")!
    let data = try? Data(contentsOf: URL(fileURLWithPath: path))
    if let gifData = data
    {
        return gifData
    }
    return Data()
}


struct Headers {
    func defaultHeaders() -> HTTPHeaders{
        let headers: HTTPHeaders = ["Authorization": "Bearer " ,
                                    "Content-Type": "application/json"]
        return headers
    }
}

//MARK: - Global Button action for storyboard

extension UIViewController{
    
    @IBAction func navigationBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func instantiate(storyboard: UIStoryboard.Storyboard) -> Self {
        let storyboard = UIStoryboard(storyboard: storyboard)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: self.nameOfClass) as? Self else {
            fatalError("Could not find view controller with name \(self.nameOfClass)")
        }
        return viewController
    }
}

extension UIViewController {
    
    @available(iOS 13.0, *)
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    @available(iOS 13.0, *)
    var sceneDelegate: SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else { return nil }
        return delegate
    }
}

