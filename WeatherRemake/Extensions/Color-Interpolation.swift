//
//  Color-Interpolation.swift
//  WeatherRemake
//
//  Created by Alex Liou on 6/21/22.
//

import SwiftUI

extension Color {

    /// Retrives the RGB values for a given Color
    /// - Returns: Double of the RGB values
    func getComponents() -> (red: Double, green: Double, blue: Double, alpha: Double) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let uiColor = UIColor(self)
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }

    /// Knows how to blend any one color with another color based on some amount value
    /// - Parameters:
    ///   - other: other Color
    ///   - amount: amount value
    /// - Returns: Color
    func interpolated(to other: Color, amount: Double) -> Color {
        let componentsFrom = self.getComponents()
        let componentsTo = other.getComponents()

        let newRed = (1.0 - amount) * componentsFrom.red + (amount * componentsTo.red)
        let newGreen = (1.0 - amount) * componentsFrom.green + (amount * componentsTo.green)
        let newBlue = (1.0 - amount) * componentsFrom.blue + (amount * componentsTo.blue)
        let newOpacity = (1.0 - amount) * componentsFrom.alpha + (amount * componentsTo.alpha)

        return Color(.displayP3, red: newRed, green: newGreen, blue: newBlue, opacity: newOpacity)
    }
}
