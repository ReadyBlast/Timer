//
//  ViewController.swift
//  Timer
//
//  Created by XE on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switcherLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var directionSwitch: UISwitch!
    
    var timer: Timer?
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopButton.isEnabled = false
        updateCounterLabel()
    }
    
    @objc func timerTickHandler() {
        if directionSwitch.isOn {
            counter += 1
        } else {
            counter -= 1
        }
        updateCounterLabel()
    }

    @IBAction func stopPressed(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        stopButton.isEnabled = false
        startButton.isEnabled = true
        directionSwitch.isEnabled = true
        switcherLabel.isEnabled = true
    }
    
    @IBAction func startPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTickHandler), userInfo: nil, repeats: true)
        stopButton.isEnabled = true
        startButton.isEnabled = false
        directionSwitch.isEnabled = false
        switcherLabel.isEnabled = false
    }
    
    func updateCounterLabel() {
        counterLabel.text = "\(counter)"
    }
}

