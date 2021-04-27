//
//  PhotoData.swift
//  TestProduct
//
//  Created by Kuniaki Ohara on 2021/01/14.
//

import SwiftUI

class PhotoData {
    var Images: [Int:CGImage?] = [0:nil]
    var Orientations: [Int:UIImage.Orientation] = [0:UIImage.Orientation.up]

    public func GetUIImages() -> [UIImage]{
        var uiImages: [UIImage] = []
        let length = Images.count
        for i in 0 ..< length {
            uiImages.append(UIImage(cgImage: Images[i]!!, scale: 0, orientation:Orientations[i]!))
        }
        
        return uiImages
    }
}
