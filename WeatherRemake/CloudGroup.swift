//
//  CloudGroup.swift
//  WeatherRemake
//
//  Created by Alex Liou on 6/20/22.
//

import Foundation

class CloudGroup {
    var lastUpdate = Date.now
    var clouds = [Cloud]()
    let opacity: Double

    func update(date: Date) {
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970

        for cloud in clouds {
            cloud.position.x -= delta * cloud.speed
            let offscreenDistance = max(400, 400 * cloud.scale)

            if cloud.position.x < -offscreenDistance {
                cloud.position.x = offscreenDistance
            }
        }

        lastUpdate = date
    }

    init(thickness: Cloud.Thickness) {
        let cloudsToCreate: Int
        let cloudScale: ClosedRange<Double>

        switch thickness {
        case .none:
            cloudsToCreate = 0
            opacity = 1
            cloudScale = 1...1
        case .thin:
            cloudsToCreate = 10
            opacity = 0.6
            cloudScale = 0.2...0.4
        case .light:
            cloudsToCreate = 10
            opacity = 0.7
            cloudScale = 0.4...0.6
        case .regular:
            cloudsToCreate = 15
            opacity = 0.8
            cloudScale = 0.7...0.9
        case .thick:
            cloudsToCreate = 25
            opacity = 0.9
            cloudScale = 1.0...1.3
        case .ultra:
            cloudsToCreate = 40
            opacity = 1
            cloudScale = 1.2...1.6
        }

        for i in 0..<cloudsToCreate {
            let scale = Double.random(in: cloudScale)
            let imageNumber = i % 8
            let cloud = Cloud(imageNumber: imageNumber, scale: scale)
            clouds.append(cloud)
        }
    }
}
