//
//  MoogLadderViewController.swift
//  SongProcessor
//
//  Created by Aurelius Prochazka on 6/22/16.
//  Copyright © 2016 AudioKit. All rights reserved.
//

import AudioKit
import UIKit

class MoogLadderViewController: UIViewController {

    @IBOutlet private weak var cutoffFrequncySlider: AKPropertySlider!
    @IBOutlet private weak var resonanceSlider: AKPropertySlider!
    @IBOutlet private weak var mixSlider: AKPropertySlider!

    let songProcessor = SongProcessor.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        cutoffFrequncySlider.minimum = 12.0
        cutoffFrequncySlider.maximum = 10_000.0

        if let freq = songProcessor.moogLadder?.cutoffFrequency {
            cutoffFrequncySlider.value = freq
        }

        if let res = songProcessor.moogLadder?.resonance {
            resonanceSlider.value = res
        }

        if let balance = songProcessor.filterMixer?.balance {
            mixSlider.value = balance
        }

        cutoffFrequncySlider.callback = updateCutoffFrequncy
        resonanceSlider.callback = updateResonance
        mixSlider.callback = updateMix
    }

    func updateCutoffFrequncy(value: Double) {
        songProcessor.moogLadder?.cutoffFrequency = value
    }

    func updateResonance(value: Double) {
        songProcessor.moogLadder?.resonance = value
    }

    func updateMix(value: Double) {
        songProcessor.filterMixer?.balance = value
    }
}
