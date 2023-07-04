//
//  SafariView.swift
//  safariservices_demo
//
//  Created by Edward Yee on 6/12/23.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    
    var vm: SafariVM
    init(vm: SafariVM) {
        self.vm = vm
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return vm.webView
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(vm: SafariVM(url: "http://developer.apple.com"))
            .previewDisplayName("Public Web Page")
        
        SafariView(vm: SafariVM(url: "http://www.smarttravelasia.com/economy.htm"))
            .previewDisplayName("Reader Mode")
    }
}
