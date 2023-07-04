//
//  AlternatePresentations.swift
//  safariservices_demo
//
//  Created by Edward Yee on 6/19/23.
//

import SwiftUI

struct PopoverView: View {
    @State var popoverSafari = false
    private let targetUrl = "https://developer.apple.com/"

    var popoverSize: CGSize? {
        get {
            if (UIDevice().model.contains(/iPhone|iPod/)) {
                return nil
            } else {
                return CGSize(width: 450, height: 600)
            }
        }
    }

    var body: some View {
        VStack {
            Button {
                popoverSafari.toggle()
            } label: {
                Text("Popover")
                    .font(.system(size: 24))
                    .frame(width: 250)
            }
            .padding(.vertical)
            .buttonStyle(.borderedProminent)
            .popover(isPresented: $popoverSafari,
                     attachmentAnchor: .point(.bottom)) {
                SafariView(vm: SafariVM(url: targetUrl))
                    .frame(width: popoverSize?.width,
                           height: popoverSize?.height)
            }
            
            Group {
                VStack(alignment: .leading) {
                    Text("iOS will display as a sheet")
                    Text("iPadOS will display a popover")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iOS")
                
        PopoverView()
            .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
            .previewDisplayName("iPad")
    }
}
