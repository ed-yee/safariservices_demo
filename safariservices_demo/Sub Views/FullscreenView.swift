//
//  FullscreenView.swift
//  safariservices_demo
//
//  Created by Edward Yee on 6/20/23.
//

import SwiftUI

struct FullscreenView: View {
    @State var fullscreenSafari = false
    private let targetUrl = "https://developer.apple.com/"
    
    var body: some View {
        VStack {
            Button {
                fullscreenSafari.toggle()
            } label: {
                Text("Fullscreen")
                    .font(.system(size: 24))
                    .frame(width: 250)
            }
            .padding(.vertical)
            .buttonStyle(.borderedProminent)
            .fullScreenCover(isPresented: $fullscreenSafari) {
                SafariView(vm: SafariVM(url: targetUrl))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.yellow)
    }
}

struct FullscreenView_Previews: PreviewProvider {
    static var previews: some View {
        FullscreenView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone")

        FullscreenView()
            .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
            .previewDisplayName("iPad")

    }
}
