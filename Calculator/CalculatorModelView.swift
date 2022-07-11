//
//  CalculatorModelView.swift
//  Calculator
//
//  Created by Gabriel Miranda on 09/07/22.
//

import SwiftUI

class CalculatorModelView: ObservableObject {
    
    @Published private var model: CalculatorModel
    
    init() {
        model = CalculatorModel()
    }
    
    var firstNumber: Double? { model.firstNumber }
    var secondNumber: Double? { model.secondNumber }
    var result: String? { model.result }
    
    func setFirstNumber(_ number: Double ){
        model.firstNumber = number
    }
    
    func setSecondNumber(_ number: Double ){
        model.secondNumber = number
    }
    
    func setOperator(_ operation: CalculatorModel.operations?){
        model.operation = operation
    }
    
    func calculate(){
        model.calculate()
    }
    
}
