//
//  DetailViewController.swift
//  MVVM2
//
//  Created by Andrew L. Jaffee on 5/14/18.
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

import UIKit

// MARK: - Detail View Controller

class DetailViewController: UIViewController {
    
    var messierViewModel: MessierViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageView.alpha = 0.0
        
        // #1 - Define a closure (completion block) INSTANCE for updating a UIImageView
        // once an image downloads.
        let imageCompletionClosure = { ( imageData: NSData ) -> Void in
            
            // #2 - Download occurs on background thread, but UI update
            // MUST occur on the main thread.
            DispatchQueue.main.async {
                
                // #3 - Animate the appearance of the Messier image.
                UIView.animate(withDuration: 1.0, animations: {
                    self.imageView.alpha = 1.0
                    self.imageView?.image = UIImage(data: imageData as Data)
                    self.view.setNeedsDisplay()
                })
                
                // #4 - Stop and hide the activity spinner as the
                // image has finished downloading
                self.activitySpinner.stopAnimating()
                
            } // end DispatchQueue.main.async
            
        } // end let imageCompletionClosure...
        
        // #5 - Start and show the activity spinner as the
        // image is about to start downloading in background.
        activitySpinner.startAnimating()
        
        // #6 - Update the UI with info from the Messier object
        // the user chose to inspect.
        titleLabel.text = messierViewModel?.formalName
        subtitleLabel.text = messierViewModel?.commonName
        updatedLabel.text = messierViewModel?.dateUpdated
        descriptionTextView.attributedText = messierViewModel?.textDescription
        
        // #7 - Start image downloading in background.
        messierViewModel?.download(completionHanlder: imageCompletionClosure)
        
    } // end func viewDidLoad
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        // #8 - make sure UITextView shows beginning
        // of Messier object description
        self.descriptionTextView.setContentOffset(CGPoint.zero, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

} // end class DetailViewController
