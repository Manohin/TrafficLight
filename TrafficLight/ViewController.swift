//
//  ViewController.swift
//  TrafficLight
//
//  Created by Alexey Manokhin on 29.01.2023.
//

import UIKit

var isLighted = false

class ViewController: UIViewController {
    
    @IBOutlet var redColorView: UIView!
    @IBOutlet var yellowColorView: UIView!
    @IBOutlet var greenColorView: UIView!
    @IBOutlet var functionalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let views:[UIView] = [redColorView, yellowColorView, greenColorView]
        
        //   views.map({ $0.layer.cornerRadius = 60 }) - Почему-то возникает ошибка "Result of call to 'map' is unused"
        
        for view in views {
            view.layer.cornerRadius = view.layer.frame.height / 2
            view.alpha = 0.3
        }
        functionalButton.layer.cornerRadius = 10
    }
    
    private func toggleStatus(_ view: UIView) {
        
        if view.alpha != 1 {
            view.alpha = 1
            isLighted = true
        } else {
            view.alpha = 0.3
            isLighted = false
        }
    }
    
    @IBAction func functionalButtonTapped() {
        
        if functionalButton.currentTitle == "START" {
            toggleStatus(redColorView)
            functionalButton.setTitle("NEXT", for: .normal)
        } else if redColorView.alpha == 1 && isLighted == true {
            toggleStatus(redColorView)
            toggleStatus(yellowColorView)
        } else if yellowColorView.alpha == 1 && isLighted == true {
            toggleStatus(yellowColorView)
            toggleStatus(greenColorView)
        } else {
            toggleStatus(greenColorView)
            toggleStatus(redColorView)
        }
    }
}

