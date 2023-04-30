//
//  LaunchScreenView.swift
//  hackathon
//
//  Created by iOS Lab on 30/04/23.
//
import SwiftUI
import AVKit

struct LaunchScreenView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(fileURLWithPath: "https://youtube.com/shorts/eb8nGKWlOk4?feature=share"))) {
            // Add any custom view content here if needed
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
