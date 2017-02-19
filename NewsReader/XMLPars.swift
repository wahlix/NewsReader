//
//  XMLParser.swift
//  NewsReader
//
//  Created by Rickard Wahlander on 2017-02-10.
//  Copyright © 2017 Korta Nyheter. All rights reserved.
//

import UIKit

@objc protocol XMLParserDelegate{
    
    func parsingWasFinished()
    
}

class XMLParser: NSObject, XMLParserDelegate {
    internal func parsingWasFinished() {
        
    }

    var arrParsedData = [Dictionary<String, String>]()
    var currentDataDictionary = Dictionary<String, String>()
    var currentElement = ""
    var foundCharacters = ""
    var delegate : XMLParserDelegate?
    var isFirst = true
    func startParsingWithContentsOfURL(rssURL: URL) {
        let parser = XMLParser(contentsOfURL: rssURL)
        parser.delegate = self
        parser.parse()
    }
    
    func parserDidEndDocument(parser: XMLParser) {
        
        delegate?.parsingWasFinished()
        
    }
    
    func parser(parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentElement = elementName
    }
    
    func parser(parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        
        if !foundCharacters.isEmpty {
            if elementName == "link" || elementName == "description" {
                foundCharacters = (foundCharacters as NSString).substring(from: 3)
            }
            currentDataDictionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "description" && !isFirst
                
            {
                arrParsedData.append(currentDataDictionary)
            }else {
                if currentElement == "description" && isFirst {
                    isFirst = false
                }
            }
        }
        
    }
    
    func parser(parser: XMLParser, foundCharacters string: String) {
        
        if currentElement == "title"  || currentElement == "description"
            || currentElement == "link" || currentElement == "pubDate"
        {
            
            foundCharacters += string
            
        }
        
    }
    
    func parser(parser: XMLParser, parseErrorOccurred parseError: NSError) {
        
        print(parseError.description)
        
    }
    
    func parser(parser: XMLParser, validationErrorOccurred validationError: NSError) {
        
        print(validationError.description)
        
    }
    
}    

