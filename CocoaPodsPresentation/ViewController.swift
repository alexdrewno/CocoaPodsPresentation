//
//  ViewController.swift
//  CocoaPodsPresentation
//
//  Created by adrewno1 on 1/12/17.
//  Copyright © 2017 adrewno1, Ty Victorson. All rights reserved.
//

import UIKit
import AVFoundation

//----------------(Confetti Things)----------------\\
import SAConfettiView
//----------------(Confetti Things)----------------\\

class ViewController: UIViewController, AVAudioPlayerDelegate {

    //----------------(Confetti Things)----------------\\
    var confettiView = SAConfettiView()
    //----------------(Confetti Things)----------------\\
    
    var horaySFX = AVAudioPlayer()
    var time = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        horaySFX = self.setupAudioPlayerWithFile("KidsCheering", type:"mp3")
        
        //----------------(Confetti Things)----------------\\
        confettiView = SAConfettiView(frame: self.view.bounds)
        //----------------(Confetti Things)----------------\\
    }
    
    @IBAction func confettiButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        //----------------(Confetti Things)----------------\\
        confettiView.type = .Triangle
        view.addSubview(confettiView)
        confettiView.startConfetti()
        //----------------(Confetti Things)----------------\\
        
        horaySFX.play()
    }
    
    func update() {
        time += 1
        if (time == 5) {
            time = 0
            timer.invalidate()
            
            //----------------(Confetti Things)----------------\\
            confettiView.stopConfetti()
            confettiView.removeFromSuperview()
            //----------------(Confetti Things)----------------\\
        }
    }
    
    // Sound setup
    func setupAudioPlayerWithFile(_ file:NSString, type:NSString) -> AVAudioPlayer  {
        //1
        let path = Bundle.main.path(forResource: file as String, ofType:type as String)
        let url = URL(fileURLWithPath: path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            print("Player not available")
        }
        
        //4
        return audioPlayer!
    }
}

