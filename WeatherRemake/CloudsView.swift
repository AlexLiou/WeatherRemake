//
//  CloudsView.swift
//  WeatherRemake
//
//  Created by Alex Liou on 6/20/22.
//

import SwiftUI

struct CloudsView: View {
    var cloudGroup: CloudGroup

    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                context.opacity = cloudGroup.opacity
                cloudGroup.update(date: timeline.date)

                for cloud in cloudGroup.clouds {
                    context.translateBy(x: cloud.position.x, y: cloud.position.y)
                    context.scaleBy(x: cloud.scale, y: cloud.scale)

                    let cloudImage = "cloud\(cloud.imageNumber)"
                    context.draw(Image(cloudImage), at: .zero, anchor: .topLeading)

                    context.transform = .identity
                }
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    init(thickness: Cloud.Thickness) {
        cloudGroup = CloudGroup(thickness: thickness)
    }
}

struct CloudsView_Previews: PreviewProvider {
    static var previews: some View {
        CloudsView(thickness: .regular)
            .background(.black)
    }
}
