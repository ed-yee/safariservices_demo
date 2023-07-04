//
//  SafariVM.swift
//  safariservices_demo
//
//  Created by Edward Yee on 6/12/23.
//

import Foundation
import SafariServices

class SafariVM: ObservableObject {
    @Published var url: String = ""

    private static let defaultURL = "http://www.google.com"

    var webView: SFSafariViewController {
        get {
            let config = SFSafariViewController.Configuration()
            config.barCollapsingEnabled = false
            config.entersReaderIfAvailable = true

            var vc: SFSafariViewController
            if let urlObj = SafariVM.validateUrl(url) {
                vc = SFSafariViewController(url: urlObj,
                                            configuration: config)
            } else {
                // If the given URL is invalid, it uses the default URL
                vc = SFSafariViewController(url: URL(string: SafariVM.defaultURL)!,
                                            configuration: config)
            }
            
            // Set view controller header and footer background color
            vc.preferredBarTintColor = .orange
            // Set view controller header and footer link color
            vc.preferredControlTintColor = .black
            // Change default "Done" link to "Close", "Cancel", or "Done"
            vc.dismissButtonStyle = .done
            
            return vc
        }
    }
    
    init(url: String = "") {
        if url != "" {
            self.url = url
        }
    }

    /// Validate URL scheme
    /// - Parameter url: Source URL
    /// - Returns: TRUE - If the source URL scheme is HTTP or HTTPS
    static func isValidUrl(_ url: String) -> Bool {
        return url.starts(with: /^https?/.ignoresCase())
    }
    
    /// Get URL object
    /// - Parameter url: Source URL
    /// - Returns: An instance or URL object or nil
    static func validateUrl(_ url: String) -> URL? {
        if (isValidUrl(url)) {
            guard let urlObj = URL(string: url) else {
                return nil
            }
            
            return urlObj
        }
        
        return nil
    }
}
