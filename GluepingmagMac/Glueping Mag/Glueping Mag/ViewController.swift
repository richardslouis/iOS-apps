//
//  ViewController.swift
//  Glueping Mag
//
//  Created by Richards Louis on 14/04/16.
//  Copyright © 2016 Richiesoft inc. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet weak var webView: WebView!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "index", withExtension:"html")
        let request = URLRequest(url: url!)
        self.webView.mainFrame.load(request)
        
         /* let urlString = "http:// website address"
         self.webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: urlString)!)) */

        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    

   //PROGRESS INDICATOR FOR WEBSITE LOADING STRAIGHT
 
    func webView(_ sender: WebView!, didStartProvisionalLoadForFrame frame: WebFrame!)
    {
        progressIndicator.startAnimation(self)
    }
    
    func webView(_ sender: WebView!, didFinishLoadForFrame frame: WebFrame!)
    {
        progressIndicator.stopAnimation(self)
    }
    
    
}

