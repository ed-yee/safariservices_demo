//
//  MiniWebBrowserView.swift
//  safariservices_demo
//
//  Created by Edward Yee on 6/30/23.
//

import SwiftUI

struct MiniWebBrowserView: View {
    @StateObject var vm = SafariVM()
    @State var showEmbeddedSafari: Bool = false
    
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("URL Address:")
                .padding(.top, 15)
            HStack {
                TextField("URL", text: $vm.url)
                    .keyboardType(.URL)
                    .textInputAutocapitalization(.never)
                    .padding(5)
                    .border(.gray)
                Button("Go") {
                    if SafariVM.isValidUrl(vm.url) {
                        showEmbeddedSafari.toggle()
                    } else {
                        errorMessage = "Invalid URL!"
                        showError.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .sheet(isPresented: $showEmbeddedSafari, content: {
            SafariView(vm: vm)
        })
        .alert(isPresented: $showError, content: {
            Alert(title: Text("Error"),
                  message: Text(errorMessage))
        })
        .navigationTitle("Like A Web Browser")
    }
}

struct MiniWebBrowserView_Previews: PreviewProvider {
    static var previews: some View {
        MiniWebBrowserView()
    }
}
