//
//  ViewController.swift
//  Segmented_Control
//
//  Created by Seungjun Lim on 22/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var alignmentControl: UISegmentedControl!
    
    @IBOutlet weak var momentarySwitch: UISwitch!
    
    @IBAction func toggleMomentary(_ sender: UISwitch) {
        alignmentControl.isMomentary = sender.isOn
    }
    
    @IBAction func alignmentChanged(_ sender: UISegmentedControl) {
        label.textAlignment = NSTextAlignment(rawValue: sender.selectedSegmentIndex) ?? .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alignmentControl.selectedSegmentIndex = label.textAlignment.rawValue
        
        momentarySwitch.isOn = alignmentControl.isMomentary
        
        // 타이틀을 코드에서 변경..
        alignmentControl.setTitle("왼쪽", forSegmentAt: 0)
        alignmentControl.setTitle("중앙", forSegmentAt: 1)
        alignmentControl.setTitle("오른쪽", forSegmentAt: 2)
    }


}

