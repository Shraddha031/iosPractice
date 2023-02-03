//
//  WebViewVC.swift
//  UIComponents
//
//  Created by Shraddha on 03/02/23.
//

import UIKit
import WebKit

class WebViewVC: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var wennView: WKWebView!
    
    var webView:WKWebView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.hackingwithswift.com")!
        wennView?.load(URLRequest(url: url))
        wennView?.allowsBackForwardNavigationGestures = true

        // Do any additional setup after loading the view.
    }
//    override func loadView() {
//        webView = WKWebView()
//        webView?.navigationDelegate = self
//        view = webView
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
