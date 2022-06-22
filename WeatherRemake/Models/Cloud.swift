//
//  Cloud.swift
//  WeatherRemake
//
//  Created by Alex Liou on 6/20/22.
//

import SwiftUI

class Cloud {
    var position: CGPoint
    let imageNumber: Int
    let speed = Double.random(in: 4...12)
    let scale: Double

    enum Thickness: CaseIterable {
        case none, thin, light, regular, thick, ultra
    }

    init(imageNumber: Int, scale: Double) {
        self.imageNumber = imageNumber
        self.scale = scale

        let startX = Double.random(in: -400...400)
        let startY = Double.random(in: -50...200)
        position = CGPoint(x: startX, y: startY)
    }
}
