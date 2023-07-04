//
//  SheetView.swift
//  safariservices_demo
//
//  Created by Edward Yee on 6/20/23.
//

import SwiftUI

struct SheetView: View {
    @State var sheetSafari = false
    private let targetUrl = "https://developer.apple.com/"
    
    var body: some View {
        VStack {
            Button {
                sheetSafari.toggle()
            } label: {
                Text("Sheet")
                    .font(.system(size: 24))
                    .frame(width: 250)
            }
            .padding(.vertical)
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $sheetSafari) {
                SafariView(vm: SafariVM(url: targetUrl))
                    .presentationDetents([.fraction(0.75), .large])
            }
            
            Spacer()
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone")

        SheetView()
            .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
            .previewDisplayName("iPad")
    }
}
