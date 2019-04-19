//
//  ViewController.swift
//  Retrocalculator
//
//  Created by Khaled Bohout on 1/14/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnsound : AVAudioPlayer!
    @IBOutlet weak var outputlbl: UILabel!
    enum operations : String {
        case add = "+"
        case sub = "-"
        case divide = "/"
        case multiply = "*"
        case empty = "empty"
    }
    var currentoperator = operations.empty
    var runningnumber : String = ""
    var leftval : String = ""
    var rieghtval : String = ""
    var result : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "sound", ofType: ".wav")
        let soundurl = URL(fileURLWithPath: path!)
        do {
            try btnsound = AVAudioPlayer(contentsOf: soundurl)
            btnsound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
       
        outputlbl.text = "0"
// Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func numberpressed (sender : UIButton)
    {
        playsound()
        runningnumber += "\(sender.tag)"
        outputlbl.text = runningnumber
    }
    func playsound()
    {
        if btnsound.isPlaying {
            btnsound.stop()
        }
        btnsound.play()
    }
    @IBAction func onaddpressed (Sender : UIButton)
    {
        processoperations(operation: .add)
    }
    @IBAction func onsubpressed (Sender : UIButton)
    {
        processoperations(operation: .sub)
    }
    @IBAction func onmulpressed (Sender : UIButton)
    {
        processoperations(operation: .multiply)
    }
    @IBAction func ondevidepressed (Sender : UIButton)
    {
        processoperations(operation: .divide)
    }
    @IBAction func onresultpressed (Sender : UIButton)
    {
        processoperations(operation: currentoperator)
    }

  func processoperations(operation : operations)  {
        if currentoperator != operations.empty {
            if runningnumber != "" {
                rieghtval = runningnumber
                runningnumber = ""
                
                if currentoperator == operations.add{
                    result = "\(Double(leftval)! + Double(rieghtval)!)"
                }
                if currentoperator == operations.sub{
                    result = "\(Double(leftval)! - Double(rieghtval)!)"
                }
                if currentoperator == operations.multiply{
                    result = "\(Double(leftval)! * Double(rieghtval)!)"
                }
                if currentoperator == operations.divide{
                    result = "\(Double(leftval)! / Double(rieghtval)!)"
                }
                leftval = result
                outputlbl.text = leftval
            }
            currentoperator = operation
            
        }
        else {
            leftval = runningnumber
            runningnumber = ""
            currentoperator = operation
        }
 
    }

}
 
