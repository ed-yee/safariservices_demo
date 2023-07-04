//
//  ContentView.swift
//  safariservices_demo
//
//  Created by Edward Yee on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var popoverSafari = false

    var popoverSize: CGSize? {
        get {
            if (UIDevice().model.contains(/iPhone|iPod/)) {
                return nil
            } else {
                return CGSize(width: 450, height: 600)
            }
        }
    }

    let title1 = "Open Through NavigationLink"
    let title2 = "Sheet"
    let title3 = "Popover"
    let title4 = "Fullscreen"
    let title5 = "Mini Web Browser"

    var body: some View {
        NavigationStack {
            List {
                NavigationLink(title1,
                               destination: SafariView(
                                vm: SafariVM(
                                    url: "http://developer.apple.com"
                                )
                               ).navigationTitle(title1))

                Section {
                    NavigationLink(title2,
                                   destination: SheetView().navigationTitle(title2))
                    NavigationLink(title3,
                                   destination: PopoverView().navigationTitle(title3))
                    NavigationLink(title4,
                                   destination: FullscreenView().navigationTitle(title4))
                } header: {
                    Text("Alternate Presentation")
                        .textCase(.none)
                        .font(.title2)
                }


                Section {
                    NavigationLink(title5,
                                   destination: MiniWebBrowserView().navigationTitle(title5))
                } header: {
                    Text("Application")
                        .textCase(.none)
                        .font(.title2)
                }

            }
            .navigationTitle("Safari View Controller Demo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
