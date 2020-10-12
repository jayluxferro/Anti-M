//
//  MStateModel.swift
//  Mosquito Repellent
//
//  Created by Jay on 12/10/2020.
//

import Foundation
import AVFoundation

class MStateModel: ObservableObject {
    @Published var isPlaying = false
    @Published var selectedMode = Constant.modes[0]
    var player: AVAudioPlayer?
    
    func playAudio(){
        if !isPlaying {
            let path = Bundle.main.path(forResource: selectedMode, ofType : "mp3")!
            let url = URL(fileURLWithPath : path)
            
            do{
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1
                player?.play()
                isPlaying = true
            }catch{
                print ("file could not be loaded or other error!")
                isPlaying = false
            }
        }else {
            player?.stop()
            isPlaying = false
        }
    }
    
}
