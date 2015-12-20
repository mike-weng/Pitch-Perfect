    //
    //  PlaySoundViewController.swift
    //  Pitch Perfect
    //
    //  Created by Mike Weng on 12/5/15.
    //  Copyright © 2015 Weng. All rights reserved.
    //
    
    import UIKit
    import AVFoundation
    
    class PlaySoundViewController: UIViewController {
        var audioFile:AVAudioFile!
        var receivedAudio: RecordedAudio!
        var audioEngine:AVAudioEngine!
        var audioPlayerNode:AVAudioPlayerNode!
        var paused = false
        var rate:Float = 1.0
        var pitch:Float = 1.0
        var reverb:Float = 1.0
        var delay:Float = 0.0
        @IBOutlet weak var pauseButton: UIButton!
        @IBOutlet weak var playButton: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            pauseButton.enabled = false
            audioEngine = AVAudioEngine()
            audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func playAudio(sender: UIButton) {
            enablePauseButton()
            if paused {
                try! audioEngine.start()
                audioPlayerNode.play()
            } else {
                playAudioWithEffects(rate, pitch: pitch, reverb: reverb)
            }
            paused = false
        }
        @IBAction func pauseAudio(sender: UIButton) {
            enablePlayButton()
            audioEngine.pause()
            audioPlayerNode.pause()
            paused = true
        }
        @IBAction func stopAudio(sender: UIButton) {
            // Stops the audio
            enablePlayButton()
            resetPlayer()
            paused = false
        }
        
        @IBAction func rateSlider(sender: UISlider) {
            rate = sender.value
        }
        @IBAction func pitchSlider(sender: UISlider) {
            pitch = sender.value
        }
        @IBAction func reverbSlider(sender: UISlider) {
            reverb = sender.value
            delay = 100 - sender.value
        }
        
        func resetPlayer() {
            audioEngine.stop()
            audioEngine.reset()
        }
        func enablePlayButton() {
            playButton.hidden = false
            playButton.enabled = true
            pauseButton.hidden = true
            pauseButton.enabled = false
        }
        func enablePauseButton() {
            pauseButton.hidden = false
            pauseButton.enabled = true
            playButton.hidden = true
            playButton.enabled = false
        }
        func playAudioWithEffects(rate: Float, pitch: Float, reverb:Float) {
            resetPlayer()
            enablePauseButton()
            
            audioPlayerNode = AVAudioPlayerNode()
            
            let changePitchEffect = AVAudioUnitTimePitch()
            changePitchEffect.pitch = -pitch
            changePitchEffect.rate = rate
            
            let changeReverbEffect = AVAudioUnitReverb()
            changeReverbEffect.wetDryMix = reverb
            
            let changeDelayEffect = AVAudioUnitDelay()
            changeDelayEffect.wetDryMix = delay
            
            audioEngine.attachNode(audioPlayerNode)
            audioEngine.attachNode(changePitchEffect)
            audioEngine.attachNode(changeReverbEffect)
            audioEngine.attachNode(changeDelayEffect)
            
            audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
            audioEngine.connect(changePitchEffect, to: changeReverbEffect, format: nil)
            audioEngine.connect(changeReverbEffect, to: changeDelayEffect, format: nil)
            audioEngine.connect(changeDelayEffect, to: audioEngine.mainMixerNode, format: nil)

            audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
            try! audioEngine.start()
            audioPlayerNode.play()
        }
        @IBAction func echoAudio(sender: UIButton) {
            playAudioWithEffects(1.0, pitch: 1.0, reverb: 30)
        }
        @IBAction func reverbAudio(sender: UIButton) {
            playAudioWithEffects(1.0, pitch: 1.0, reverb: 90)
        }
        @IBAction func slowAudio(sender: UIButton) {
            // Play audio sloooowlyyy..
            playAudioWithEffects(0.5, pitch: 1.0, reverb: 0.0)
        }
        @IBAction func fastAudio(sender: UIButton) {
            // Play audio fast
            playAudioWithEffects(2.0, pitch: 1.0, reverb: 0.0)
        }
        @IBAction func chipmonkAudio(sender: UIButton) {
            playAudioWithEffects(1.0, pitch: -1000, reverb: 0.0)
        }
        @IBAction func darthAudio(sender: UIButton) {
            playAudioWithEffects(1.0, pitch: 1000, reverb: 0.0)
        }
        /*
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        }
        */
        
    }