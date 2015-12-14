//
//  PostCell.swift
//  CC98
//
//  Created by CCNT on 12/8/15.
//  Copyright © 2015 Orpine. All rights reserved.
//

import Foundation
import UIKit



class PostCell:UITableViewCell,UIWebViewDelegate{
    
    
    
    @IBOutlet weak var webView: UIWebView!
    var content:String?
    
    func webViewDidFinishLoad(webView: UIWebView) {
        NSLog("reach")
        let height = webView.stringByEvaluatingJavaScriptFromString("document.body.offsetHeight")
        let width = webView.stringByEvaluatingJavaScriptFromString("document.body.offsetWidth")
        if height != "" {
            var frame=self.frame
            frame.size.height = CGFloat((height! as NSString).doubleValue)
            frame.size.width = CGFloat((width! as NSString).doubleValue)
//            frame.size.width
            self.frame = frame
//            webView.frame=frame
        }
        
    }
    func setView(){
        let baseURL = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
        webView.loadHTMLString(content!, baseURL: baseURL)
        webView.scrollView.bounces = false
        webView.layer.cornerRadius = 6;
        webView.layer.masksToBounds = true
//        let height = webView.stringByEvaluatingJavaScriptFromString("document.bo")
//        let height=webView.stringByEvaluatingJavaScriptFromString("document.body.offsetHeight")
        

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
//        containerView.layer.cornerRadius = 4
//        containerView.layer.borderWidth = 1
//        containerView.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue:0.85, alpha: 0.9).CGColor
//        containerView.layer.masksToBounds = true
        //self.backgroundColor = UIColor.greenColor()
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        /*
        if selected {
        self.containerView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue:0.85, alpha: 0.4)
        }else{
        self.containerView.backgroundColor = UIColor(red: 0.988, green: 0.988, blue:0.988, alpha: 1)
        }*/
        // Configure the view for the selected state
    }
}