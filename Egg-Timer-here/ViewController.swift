//
//  ViewController.swift
//  Egg-Timer-here
//
//  Created by Dauletkhanova Saniya on 29.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.0
        
    }
    
    var player: AVAudioPlayer!
    var counter = 0
    var progressChange = 0.0
    
    var timer = Timer()
    

    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
            progressView.progress = 0.0
        
            timer.invalidate()
        
            let hardness = (sender.titleLabel?.text)!
        
            print(eggTimes[hardness]!)
        
            counter = eggTimes[hardness]!
        
            progressChange = 1.0/Double(counter)
        
            question.text = hardness
        
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds.")
            counter -= 1
            progressView.progress += Float(progressChange)

        
        } else {
            timer.invalidate()
            progressView.progress = 1
            question.text = "Done!"
            playSound()
        }
        
        func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
        
    }
    
}



