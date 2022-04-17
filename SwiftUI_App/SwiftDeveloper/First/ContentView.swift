//
//  ContentView.swift
//  SwiftUI_App
//
//  Created by Karakhanyan Tigran on 14.04.2022.
//

import SwiftUI
import AVFoundation

class PlayerViewModel: ObservableObject {
    @Published public var maxDuration = 0.0
    private var player: AVAudioPlayer?
    
    public func play() {
        playSound(name: "test")
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func playSound(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView: View {
    
    @State private var progress: Float = 0
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
            Slider(value: Binding(get: {
                self.progress
            }, set: { newValue in
                self.progress = newValue
            }), in: 0...100).padding()
            HStack {
                Button {
                    viewModel.play()
                } label: {
                    Text("Play")
                }.frame(width: 100, height: 50).background(.orange).cornerRadius(10)
                Spacer().frame(width: 20)
                Button {
                    viewModel.stop()
                } label: {
                    Text("Stop")
                }.frame(width: 100, height: 50).background(.orange).cornerRadius(10)
            }
        }
    }
}
