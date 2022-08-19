//
//  ViewController.swift
//  Counter Clicker macOS
//
//  Created by Simon Vincent on 19/08/2022.
//

import Cocoa
import AppKit
import AVFoundation

var incrementAmount: Int = 1
var totalClicks: Int = 0
var player = AVPlayer()

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBOutlet weak var minusButton: NSButton!
    @IBOutlet weak var plusButton: NSButton!
    @IBOutlet weak var totalDisplay: NSTextField!
    @IBOutlet weak var dropDownDisplay: NSComboBox!
    
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        totalClicks = totalClicks - incrementAmount
        updateUI()
        playSound(sound: "click")
    }
    
    @IBAction func plusButtonClicked(_ sender: Any) {
        totalClicks = totalClicks + incrementAmount
        updateUI()
        playSound(sound: "click")
    }
    
    @IBAction func dropDownAmountSelected(_ sender: NSComboBox) {
        let amount = sender.stringValue
        if amount == "1" {
            incrementAmount = 1
            self.plusButton.title = "+1"
            self.minusButton.title = "-1"
        }
        if amount == "2" {
            incrementAmount = 2
            self.plusButton.title = "+2"
            self.minusButton.title = "-2"
        }
        if amount == "5" {
            incrementAmount = 5
            self.plusButton.title = "+5"
            self.minusButton.title = "-5"
        }
        if amount == "10" {
            incrementAmount = 10
            self.plusButton.title = "+10"
            self.minusButton.title = "-10"
        }
        
    
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        resetTotal()
        updateUI()
        playSound(sound: "reset-click")
    }
    
    
    func playSound(sound: String) {
        if let soundURL = Bundle.main.url(forResource: sound, withExtension: "mp3") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
    }
    
    func resetTotal() {
        totalClicks = 0
        updateUI()
        playSound(sound: "reset-click")
    }
    
    func updateUI () {
        self.totalDisplay.stringValue = ("\(totalClicks)")
    }
}
    


