//
//  ViewController.swift
//  WebViewTraining
//
//  Created by Michiru Tanaka on 2015/02/14.
//  Copyright (c) 2015年 R4HS Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var path = NSBundle.mainBundle().pathForResource("index", ofType: "html", inDirectory: "html")
        var request = NSURLRequest(URL: NSURL(fileURLWithPath: path!)!)
        webView.loadRequest(request)
        webView.delegate = self
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        var scheme = "mas://"
        if request.URL.absoluteString?.hasPrefix(scheme) != nil {
            println("The URL is native://")
            return false
        }

        return true
    }

    @IBAction func callJavaScriptAction(sender: AnyObject) {
        
        var a = 10;
        var b = 20;
        var js = "addCalc(\(a),\(b));"
        println(js)
        webView.stringByEvaluatingJavaScriptFromString(js)
        
    }
}

