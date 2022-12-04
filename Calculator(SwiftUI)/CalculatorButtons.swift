//
//  CalculatorButtons.swift
//  Calculator(SwiftUI)
//
//  Created by GIORGI's MacPro on 04.12.22.
//

import Foundation
import SwiftUI

enum CalculatorButtons: String {
    case one  = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    
    case add = "+"
    case substract = "-"
    case divide = "/"
    case multiply = "*"
    case equal = "="
    
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    
    var grayBlack: RadialGradient {
        RadialGradient(gradient: Gradient(colors: [Color.gray, Color.black]), center: .center, startRadius: 1, endRadius: 80)
    }
    
    var redBlack: RadialGradient {
        RadialGradient(gradient: Gradient(colors: [Color.red, Color.black]), center: .center, startRadius: 1, endRadius: 80)
    }
    
    var greenwBlack: RadialGradient {
        RadialGradient(gradient: Gradient(colors: [Color.green, Color.black]), center: .center, startRadius: 1, endRadius: 80)
    }
    
    var buttonsColors: RadialGradient {
        switch self {
            case .add, .substract, .multiply, .equal:
                return grayBlack
                
            case .clear, .negative, .percent, .divide:
                return greenwBlack
                
            default:
                return redBlack
        }
    }
}


