//
//  Model.swift
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

// MARK: - Model Support

struct updatedDate {
    
    let month:  Int
    let day:    Int
    let year:   Int
    
}

// MARK: - Model

struct MessierDataModel {
    
    let formalName: String  // "Messier" #
    let commonName: String  // common name
    let pageLink:   String  // NASA overview page
    let imageLink:  String  // NASA detail image link
    let updateDate: updatedDate // NASA page updated date
    let description: String // Messier object description
    let thumbnail:  String  // placeholder for detail image
    
}

// MARK: - Model Data

// For info on use of NASA data, see https://www.nasa.gov/multimedia/guidelines/index.html

let updateDateMessier1 = updatedDate(month: 10, day: 19, year: 2017)

let Messier1 = MessierDataModel(formalName: "Messier 1", commonName: "The Crab Nebula", pageLink: "https://www.nasa.gov/feature/goddard/2017/messier-1-the-crab-nebula", imageLink: "https://www.nasa.gov/sites/default/files/thumbnails/image/crab-nebula-mosaic.jpg", updateDate: updateDateMessier1, description: "In 1054, Chinese astronomers took notice of a \'guest star\' that was, for nearly a month, visible in the daytime sky. The \'guest star\' they observed was actually a supernova explosion, which gave rise to the Crab Nebula, a six-light-year-wide remnant of the violent event. ...", thumbnail: "telescope")

let updateDateMessier8 = updatedDate(month: 10, day: 19, year: 2017)

let Messier8 = MessierDataModel(formalName: "Messier 8", commonName: "The Lagoon Nebula", pageLink: "https://www.nasa.gov/feature/goddard/2017/messier-8-the-lagoon-nebula", imageLink: "https://www.nasa.gov/sites/default/files/thumbnails/image/heic1015a.jpg", updateDate: updateDateMessier8, description: "Commonly known as the Lagoon Nebula, M8 was discovered in 1654 by the Italian astronomer Giovanni Battista Hodierna, who, like Charles Messier, sought to catalog nebulous objects in the night sky so they would not be mistaken for comets. This star-forming cloud of interstellar gas is located in the constellation Sagittarius and its apparent magnitude of 6 makes it faintly visible to the naked eye in dark skies. The best time to observe M8 is during August. ...", thumbnail: "telescope")

let updateDateMessier57 = updatedDate(month: 10, day: 19, year: 2017)

let Messier57 = MessierDataModel(formalName: "Messier 57", commonName: "The Ring Nebula", pageLink: "https://www.nasa.gov/feature/goddard/2017/messier-57-the-ring-nebula", imageLink: "https://www.nasa.gov/sites/default/files/thumbnails/image/ring-nebula-full_jpg.jpg", updateDate: updateDateMessier57, description: "M57, or the Ring Nebula, is a planetary nebula, the glowing remains of a sun-like star. The tiny white dot in the center of the nebula is the star\'s hot core, called a white dwarf. M57 is about 2,000 light-years away in the constellation Lyra, and is best observed during August. Discovered by the French astronomer Antoine Darquier de Pellepoix in 1779, the Ring Nebula has an apparent magnitude of 8.8 and can be spotted with moderately sized telescopes. ...", thumbnail: "telescope")



