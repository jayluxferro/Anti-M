//
//  ContentView.swift
//  Mosquito Repellent
//
//  Created by Jay on 12/10/2020.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var mStateModel = MStateModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Mode")) {
                        Picker("Frequency", selection: $mStateModel.selectedMode) {
                            ForEach(Constant.modes, id: \.self){ mode in
                                Text("\(mode) KHz")
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                }
                Spacer()
                
                Button(mStateModel.isPlaying ? "Stop" : "Start"){
                    mStateModel.playAudio()
                }
                .font(.headline)
                .frame(width: 50, height: 50, alignment: .center)
                .padding(20)
                .background(mStateModel.isPlaying ? Color.pink : Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .animation(.default)
                
            }
            .navigationTitle(Text("Mosquito Repellent"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
