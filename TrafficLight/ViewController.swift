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
        
        if functionalButton.currentTitle == "START" {
            toggleStatus(colorViews[0])
            functionalButton.setTitle("NEXT", for: .normal)
        } else if colorViews[0].alpha == 1 {
            toggleStatus(colorViews[0])
            toggleStatus(colorViews[1])
        } else if colorViews[1].alpha == 1 {
            toggleStatus(colorViews[1])
            toggleStatus(colorViews[2])
        } else {
            toggleStatus(colorViews[2])
            toggleStatus(colorViews[0])
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
