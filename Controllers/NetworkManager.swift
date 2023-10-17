//
//  NetworkManager.swift
//  uia
//
//  Created by EMPULSE on 03/10/23.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    var topNavigationBar: TopNavigationBar?

    private init() {
        startNetworkMonitoring()
    }

    private func startNetworkMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    @objc private func networkStatusChanged(_ notification: Notification) {
        if isInternetAvailable() {
            // Internet is available
            updateTopNavigationBarColor(isInternetAvailable: true)
        } else {
            // Internet is not available
            updateTopNavigationBarColor(isInternetAvailable: false)
        }
    }

     func isInternetAvailable() -> Bool {
        guard let url = URL(string: "https://www.apple.com") else {
            return false
        }
        do {
            let data = try Data(contentsOf: url)
            return (data.count > 0)
        } catch {
            return false
        }
    }

    private func updateTopNavigationBarColor(isInternetAvailable: Bool) {
        if isInternetAvailable {
            DispatchQueue.main.async {
                self.topNavigationBar?.mainContainer.backgroundColor = .green
            }
        } else {
            DispatchQueue.main.async {
                // Set the background color and label text for no internet
                self.topNavigationBar?.mainContainer.backgroundColor = .red
            }
        }
    }
}
