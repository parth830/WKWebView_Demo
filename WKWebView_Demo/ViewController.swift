//
//  ViewController.swift
//  WKWebView_Demo
//
//  Created by Ayaan Ruhi on 10/11/18.
//  Copyright © 2018 parth. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
        addKVObserver()
    }
    
    func loadWebView() {
        let urlString = "https://www.apple.com"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    // MARK: Add key value observer when webview is loading
    func addKVObserver() {
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }

}

