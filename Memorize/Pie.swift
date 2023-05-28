//
//  Pie.swift
//  Memorize
//
//  Created by Bruno Rangel on 27/05/23.
//

import SwiftUI

struct Pie: Shape {
    // var it's used here because of the animation
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let startPoint = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * (sin(startAngle.radians) as CGFloat)
        )

        var p = Path()
        p.move(to: center)
        p.addLine(to: startPoint)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        )
        p.addLine(to: center)
        return p
    }
}
