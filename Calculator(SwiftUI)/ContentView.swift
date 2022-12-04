//
//  ContentView.swift
//  Calculator(SwiftUI)
//
//  Created by GIORGI's MacPro on 04.12.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var value = "0"
    
    let buttons : [[CalculatorButtons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
//            LinearGradient(colors: [Color.black, Color.yellow, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
            RadialGradient(gradient: Gradient(colors: [Color.yellow, Color.black]), center: .center, startRadius: 1, endRadius: 700).ignoresSafeArea()
            
            // Color.gray.ignoresSafeArea()
            VStack {
                Spacer()
                // Text Display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                .padding()
                
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
                                    .background(item.buttonsColors)
                                    .shadow(color: .white, radius: 5, x: 0, y: 0)
                                    .foregroundColor(.black)
                                    .font(.system(size: 60))
                                    .fontWeight(.bold)
                                    .cornerRadius(buttonsWidth(item: item) / 6)
                            })
                        }
                    }
                }
                .shadow(color: .black, radius: 2, x: 0, y: 0)
            }
            .padding(.bottom, 40)
            
        }
    }
    
    func didTap(button: CalculatorButtons){

        switch button {
            case .equal, .add, .substract, .multiply:
                break
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
