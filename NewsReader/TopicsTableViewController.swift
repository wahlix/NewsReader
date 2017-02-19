//
//  TopicsTableViewController.swift
//  NewsReader
//
//  Created by Rickard Wahlander on 2017-02-10.
//  Copyright © 2017 Korta Nyheter. All rights reserved.
//

import UIKit

class TopicsTableViewController: UITableViewController, XMLParserDelegate {
    
    var xmlParser : XMLParser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.kortanyheter.se/rss")
        xmlParser = XMLParser()
        xmlParser.delegate = self
        xmlParser.startParsingWithContentsOfURL(rssURL: NSURL)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: XMLParserDelegate method implementation
    
    func parsingWasFinished() {
        self.tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return xmlParser.arrParsedData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as UITableViewCell
        
        let currentDictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        
        cell.textLabel?.text = currentDictionary["title"]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictionary = xmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        let tutorialLink = dictionary["link"]
        let publishDate = dictionary["pubDate"]
        
        let newsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "idNewsViewController") as! NewsViewController
        
        NewsViewController.tutorialURL = URL(string: tutorialLink!)
        NewsViewController.publishDate = publishDate
        
        showDetailViewController(NewsViewController, sender: self)
        
    }
    
}
