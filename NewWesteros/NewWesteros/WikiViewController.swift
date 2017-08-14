//
//  WikiViewController.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 14/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var browserView: UIWebView!
    
    let model : House
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        
        activityView.isHidden = false
        activityView.startAnimating()
        title = "\(model.name)'s Wiki"
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: model.wikiURL))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syncViewWithModel()
        
    }
}

extension WikiViewController :  UIWebViewDelegate{
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (navigationType == .linkClicked) ||
            (navigationType == .formSubmitted) {
            return false
        }else{
            return true
        }
    }

}