//
//  SVGProcessor.swift
//  ExampleApp
//
//  Created by Nico Valentini Mac Adden on 10/03/2023.
//

import Foundation
import UIKit
import Kingfisher
import SVGKit

public struct SVGImgProcessor:ImageProcessor {
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
