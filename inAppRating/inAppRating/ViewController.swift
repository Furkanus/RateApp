//
//  ViewController.swift
//  inAppRating
//
//  Created by Furkan Hanci on 10/26/20.
//

import UIKit
import StoreKit
import ObjectiveC

class ViewController: UIViewController {
    
    private let button : UIButton = {
        let button = UIButton()
        button.setTitle("Rate Now!", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: UIControl.State.normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 55)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
  
    
    @objc func buttonTapped() {
        let alert = UIAlertController(title: "FeedBack", message: "Are You Enjoying The App?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yess I Love it" , style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            guard let scene = self.view.window?.windowScene else {
                print("no scene")
                return
            }
            
            SKStoreReviewController.requestReview(in: scene)
        }))
        
        alert.addAction(UIAlertAction(title: "Nope i Hate it", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }


}

