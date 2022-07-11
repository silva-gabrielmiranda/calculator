//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Gabriel Miranda on 09/07/22.
//

import Foundation

struct CalculatorModel {
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var operation: operations? = nil
    var result: String? = nil
    
    enum operations:String {
        case plus = "Adição"
        case minus = "Subtração"
        case multiply = "Multiplicação"
        case divide = "Divisão"
    }
    
    init() { }
    
    mutating func calculate(){
        if let operador = operation {
            switch(operador){
            case .plus: result = "\(firstNumber + secondNumber)"
            case .minus: result = "\(firstNumber - secondNumber)"
            case .multiply: result = "\(firstNumber * secondNumber)"
            case .divide: result = secondNumber != 0 ? "\(firstNumber / secondNumber)" : "Divisor não pode ser 0"
            }
        } else {
            result = "Selecione um operador"
        }
    }
    
}
