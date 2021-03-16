//
//  ViewController.swift
//  project4
//
//  Created by mac on 2021/3/16.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate { //extend WKNavigationDelegate
    var webView: WKWebView!
    

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let url = URL(string: "https://www.hackingwithswift.com")!//加上驚嘆號 如果為空就不執行 避免error

        webView.load(URLRequest(url: url))
        //可以右滑回上一頁
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func openTapped() {
        //open選項
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        //加上guard以防為空的狀態無法往下執行
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url: url))
    }
    //webview加上標題
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }


}

