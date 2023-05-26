//
//  CoverSt.swift
//  MatzeeIIWithDragable Dice
//
//  Created by Derek Fitzer on 4/3/23.
//

import Foundation

class Album{
    var frontImage: String
    var backImage: String
    init(frontImage: String, backImage: String) {
        self.frontImage = frontImage
        self.backImage = backImage
    }
}

var d = Album(frontImage: "d1", backImage: "d2")
var y = Album(frontImage: "y1", backImage: "y2")
var eb = Album(frontImage: "eb1", backImage: "eb2")
var ch = Album(frontImage: "ch1", backImage: "ch2")
var dd = Album(frontImage: "dd1", backImage: "dd2")
var r = Album(frontImage: "r1", backImage: "r2")

