//
//  ViewController.swift
//  Infinitedam
//
//  Created by Richards Louis on 14/04/16.
//  Copyright © 2016 Richiesoft inc. All rights reserved.
//

import Cocoa
import WebKit

class ViewController2: NSViewController {
    
    @IBOutlet weak var webView: WebView!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSBundle.mainBundle().URLForResource("noproceed", withExtension:"html")
        let request = NSURLRequest(URL: url!)
        self.webView.mainFrame.loadRequest(request)
        
        /* let urlString = "http:// website address"
         self.webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!)) */
        
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    
    //PROGRESS INDICATOR FOR WEBSITE LOADING STRAIGHT
    
    func webView(sender: WebView!, didStartProvisionalLoadForFrame frame: WebFrame!)
    {
        progressIndicator.startAnimation(self)
    }
    
    func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!)
    {
        progressIndicator.stopAnimation(self)
    }
    
    
}


