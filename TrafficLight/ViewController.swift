//
//  ViewController.swift
//  TrafficLight
//
//  Created by Alexey Manokhin on 29.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redColorView: UIView!
    @IBOutlet var yellowColorView: UIView!
    @IBOutlet var greenColorView: UIView!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let views:[UIView] = [redColorView, yellowColorView, greenColorView]
        
        //   views.map({ $0.layer.cornerRadius = 60 }) - Почему-то возникает ошибка "Result of call to 'map' is unused"
        for view in views {
            view.layer.cornerRadius = 60
            view.alpha = 0.3
        }
        button.layer.cornerRadius = 10
    }
    
    var isLighted = false
    
    private func switchStatus(_ view: UIView) {
        if view.alpha != 1 {
            view.alpha = 1
            isLighted = true
        } else {
            view.alpha = 0.3
            isLighted = false
        }
    }
    
    @IBAction func functionalButton() {
        
        if button.currentTitle == "START" {
            switchStatus(redColorView)
            button.setTitle("NEXT", for: .normal)
        } else if redColorView.alpha == 1 && isLighted == true {
            switchStatus(redColorView)
            switchStatus(yellowColorView)
        } else if yellowColorView.alpha == 1 && isLighted == true {
            switchStatus(yellowColorView)
            switchStatus(greenColorView)
        } else {
            switchStatus(greenColorView)
            switchStatus(redColorView)
        }
    }
}

