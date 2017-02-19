//
//  NewsViewController.swift
//  NewsReader
//
//  Created by Rickard Wahlander on 2017-02-10.
//  Copyright © 2017 Korta Nyheter. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    class NewsViewController: UIViewController {
        
        var newsURL : NSURL!
        
        @IBOutlet weak var webview: UIWebView!
        
        @IBOutlet weak var toolbar: UIToolbar!
        
        @IBOutlet weak var pubDateButtonItem: UIBarButtonItem!
    }
    @IBAction func showPublishDate(sender: AnyObject) {
    }
}
