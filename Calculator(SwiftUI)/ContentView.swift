//
//  ContentView.swift
//  Calculator(SwiftUI)
//
//  Created by GIORGI's MacPro on 04.12.22.
//

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
    case subtract = "-"
    case devide = "/"
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
    
//    var buttonsColors: RadialGradient {
//        switch self {
//            case .add, .subtract, .multiply, .equal:
//                return grayBlack
//
//            case .clear, .negative, .percent, .devide:
//                return greenwBlack
//
//            default:
//                return redBlack
//        }
//    }
}


enum Operation: String {
    case add = "+", subtract = "-", multiply = "*", devide = "/", none
}


struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    @State var presentAlert: Bool = true
    
    let buttons : [[CalculatorButtons]] = [
        [.clear, .negative, .percent, .devide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
//            LinearGradient(colors: [Color.black, Color.yellow, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
//           RadialGradient(gradient: Gradient(colors: [Color.yellow, Color.black]), center: .center, startRadius: 1, endRadius: 700).ignoresSafeArea()
            
            
            Color("backgroundColor").ignoresSafeArea()
            
            VStack {
                Spacer()
                // Text Display
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("backgroundColor"))
                        .frame(width: UIScreen.main.bounds.width - 4*10, height: 220)
                                    .overlay(
                                        Text(value)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                            .padding()
                                            .bold()
                                            
                                            .font(.system(size: 70))
                                            .foregroundColor(.black)
                                            .italic()
                                    )
                }
                .padding()
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                
                
                //Our buttons
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id:\.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }
                                   , label: {
                                Text(item.rawValue)
                                    .frame(width: buttonsWidth(item: item), height: buttonsHeight(), alignment: .center)
                                    
                                    .background(Color("backgroundColor"))
//                                    .shadow(color: .black, radius: 5, x: 0, y: 0)
                                    .foregroundColor(.black)
                                    .font(.system(size: 60))
                                    .fontWeight(.medium)
                                    .cornerRadius(buttonsWidth(item: item) / 2)
                            })
                        }
                    }
                    
                }
                .shadow(color: .gray, radius: 3, x: 5, y: 5)
            }
            .padding(.bottom, 40)
            
        }
    }
    
    func didTap(button: CalculatorButtons){

        switch button {
                
            case .add, .subtract, .multiply, .devide, .equal:
                if button == .add  {
                    currentOperation = .add
                    self.runningNumber = Int(self.value) ?? 0
                    
                } else if button == .subtract {
                    currentOperation = .subtract
                    self.runningNumber = Int(self.value) ?? 0
                    
                } else if button == .multiply {
                    currentOperation = .multiply
                    self.runningNumber = Int(self.value) ?? 0
                    
                } else if button == .devide {
                    currentOperation = .devide
                    self.runningNumber = Int(self.value) ?? 0
                    
                } else if button == .equal {
                    let runningValue = self.runningNumber
                    let currentValue = Int(self.value) ?? 0
                    switch self.currentOperation {
                        case .add:
                            self.value = "\(runningValue + currentValue)"
                        case .subtract:
                            self.value = "\(runningValue - currentValue)"
                        case .multiply:
                            self.value = "\(runningValue * currentValue)"
                        case .devide:
                            if currentValue == 0 {
                                break
                            } else {
                                self.value = "\(runningValue / currentValue)"
                            }
                        case .none:
                            break
                    }
                }
                
                if button != .equal {
                    self.value = "0"
                }
                
            case .decimal, .negative, .percent:
                break
            case .clear:
                self.value = "0"
            default:
                let number = button.rawValue
                if self.value == "0" {
                     value = number
                } else {
                    self.value = "\(self.value)\(number)"
                }
        }
    }
    
    func buttonsWidth(item: CalculatorButtons) -> CGFloat {
        if item == .equal {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonsHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
