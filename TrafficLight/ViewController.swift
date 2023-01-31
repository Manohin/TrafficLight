//
//  ViewController.swift
//  TrafficLight
//
//  Created by Alexey Manokhin on 29.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorViews: [UIView]!
    @IBOutlet var functionalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for view in colorViews {
            view.layer.cornerRadius = view.layer.frame.height / 2
            view.alpha = 0.3
        }
        functionalButton.layer.cornerRadius = 10
    }
    
    @IBAction func functionalButtonTapped() {
        
        let redColorView = colorViews[0]
        let yellowColorView = colorViews[1]
        let greenColorView = colorViews[2]
        
        if functionalButton.currentTitle == "START" {
            toggleStatus(redColorView)
            functionalButton.setTitle("NEXT", for: .normal)
        } else if redColorView.alpha == 1 {
            toggleStatus(redColorView)
            toggleStatus(yellowColorView)
        } else if yellowColorView.alpha == 1 {
            toggleStatus(yellowColorView)
            toggleStatus(greenColorView)
        } else {
            toggleStatus(greenColorView)
            toggleStatus(redColorView)
        }
    }
    
    private func toggleStatus(_ view: UIView) {
        
        if view.alpha != 1 {
            view.alpha = 1
        } else {
            view.alpha = 0.3
        }
    }
}
