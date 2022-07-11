//
//  ContentView.swift
//  Calculator
//
//  Created by Gabriel Miranda on 17/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var calculator: CalculatorModelView
    @State private var firstNumber: Double = 0
    @State private var secondNumber: Double = 0
    @State private var operation: CalculatorModel.operations? = nil
    @State private var username: String = ""
    
    var body: some View {
        VStack{
            Text("Calculadora de estagiário").font(.title)
            Form{
                
                Text("Primeiro número:")
                TextField(
                    "Digite um número",
                    value: $firstNumber,
                    format: .number
                )
                    .disableAutocorrection(true)
                
                Text("Segundo número:")
                TextField(
                    "Digite um número",
                    value: $secondNumber,
                    format: .number
                )
                    .disableAutocorrection(true)
                
                Menu(operatorString(operation)){
                    Button("+", action: { operation = .plus })
                    Button("-", action: { operation = .minus })
                    Button("*", action: { operation = .multiply })
                    Button("/", action: { operation = .divide })
                }
                
                HStack {
                    Text("Resultado:")
                    Text(getResult())
                }
                
            }
            Text("Calcular")
                .padding()
                .foregroundColor(.blue)
                .font(Font.body.weight(.bold))
                .onTapGesture {
                    calcular()
                }
        }
    }
    
    private func getResult() -> String {
        if let result = calculator.result {
            return result
        } else {
            return ""
        }
    }
    
    private func calcular() {
        calculator.setFirstNumber(firstNumber)
        calculator.setSecondNumber(secondNumber)
        calculator.setOperator(operation)
        
        calculator.calculate()
    }
    
    private func operatorString(_ text: CalculatorModel.operations?) -> String {
        if let text = text {
            return text.rawValue
        } else {
            return "Selecione um operador"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(calculator: CalculatorModelView())
    }
}
