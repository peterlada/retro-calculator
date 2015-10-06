//
//  ViewController.swift
//  retro-calculator
//
//  Created by Peter Lada on 10/5/15.
//  Copyright © 2015 Peter Lada. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Equals = "="
        case Empty = ""
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation = Operation.Empty

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            buttonSound = try AVAudioPlayer(contentsOfURL: soundUrl)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        outputLbl.text = "0"
    }

    @IBAction func numberPressed(btn: UIButton!) {
        playSound()
        runningNumber += String(btn.tag)
        outputLbl.text = runningNumber
    }
    
    @IBAction func didPressAdd(btn: UIButton!) {
        processOperation(Operation.Add)
    }
    
    @IBAction func didPressSubtract(btn: UIButton!) {
        processOperation(Operation.Subtract)
    }

    @IBAction func didPressMultiply(btn: UIButton!) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func didPressDivide(btn: UIButton!) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func didPressEqual(btn: UIButton!) {
        processOperation(Operation.Equals)
    }
    
    func processOperation(oper: Operation) {
        playSound()
    }
    
    func playSound() {
        if buttonSound.playing {
            buttonSound.stop()
        }
        buttonSound.play()
        
    }

}

