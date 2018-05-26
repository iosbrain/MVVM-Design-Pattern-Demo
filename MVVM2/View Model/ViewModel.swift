//
//  ViewModel.swift
//  MVVM1
//
//  Created by Andrew L. Jaffee on 5/12/18.
//
/*
 
 Copyright (c) 2017-2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 NOTE: As this code makes URL references to NASA images, if you make use of
 those URLs, you MUST abide by NASA's image guidelines pursuant to
 https://www.nasa.gov/multimedia/guidelines/index.html
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

import Foundation

// #1 - "Should I Stay or Should I Go"
// - The Clash
import UIKit

/**
 #2 - Define a closure TYPE for updating a UIImageView once an image downloads.
 
 - parameter imageData: raw NSData making up the image
 */
public typealias ImageDownloadCompletionClosure = (_ imageData: NSData ) -> Void

// MARK: - #3 - App data through ViewModel

var messierViewModel: [MessierViewModel] =
    [MessierViewModel(messierDataModel: Messier1),
     MessierViewModel(messierDataModel: Messier8),
     MessierViewModel(messierDataModel: Messier57)]

// MARK: - #4 - View Model

class MessierViewModel
{
    
    // #5 - I use some private properties solely for
    // preparing data for presentation in the UI.
    
    private let messierDataModel: MessierDataModel
    
    private var imageURL: URL
    
    private var updatedDate: Date?
    
    init(messierDataModel: MessierDataModel)
    {
        self.messierDataModel = messierDataModel
        self.imageURL = URL(string: messierDataModel.imageLink)!
    }
    
    // #6 - Data is made available for presentation only
    // through public getters. No direct access to Model.
    // Some getters prepare data for presentation.

    public var formalName: String {
        return "Formal name: " + messierDataModel.formalName
    }
    
    public var commonName: String {
        return "Common name: " + messierDataModel.commonName
    }
    
    public var dateUpdated: String {
        
        let dateString = String(messierDataModel.updateDate.year) + "-" +
                         String(messierDataModel.updateDate.month) + "-" +
                         String(messierDataModel.updateDate.day)
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM dd, yyyy"
        
        if let date = dateFormatterGet.date(from: dateString) {
            updatedDate = date
            return "Updated: " + dateFormatterPrint.string(from: date)
        }
        else {
            return "There was an error decoding the string"
        }
    }
    
    // #7 - Controversial? Should this SOLELY live in the UI?
    public var textDescription: NSAttributedString {
        
        let fontAttributes = [NSAttributedStringKey.font:  UIFont(name: "Georgia", size: 14.0)!, NSAttributedStringKey.foregroundColor: UIColor.blue]
        let markedUpDescription = NSAttributedString(string: messierDataModel.description, attributes:fontAttributes)
        return markedUpDescription
        
    }
    
    public var thumbnail: String {
        return messierDataModel.thumbnail
    }
    
    // #8 - Controversial? Is passing a completion handler into the view
    // model problematic? Should I use KVO or delegation? All's I'm
    // doing is getting some NSData/Data.
    func download(completionHanlder: @escaping ImageDownloadCompletionClosure)
    {
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url:imageURL)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            
            if let tempLocalUrl = tempLocalUrl, error == nil {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    let rawImageData = NSData(contentsOf: tempLocalUrl)
                    completionHanlder(rawImageData!)
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
            } else {
                print("Error took place while downloading a file. Error description: \(String(describing: error?.localizedDescription))")
            }
        } // end let task
        
        task.resume()
        
    } // end func download

} // end class MessierViewModel
