//
//  ContentView.swift
//  Calculator
//
//  Created by josefin hellgren on 2023-08-21.
//

import SwiftUI

enum OperatorType{
    case addition
    case subtraction
    case multiplication
    case division
    case equal
    
    var symbol : String {
        switch self{
            
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
           return "*"
        case .division:
           return "/"
        case .equal:
          return  "="
        }
    }
    
}

struct ContentView: View {
    @State private var displayedNumber = 0
    @State private var selectedOperator : OperatorType?
    @State private var sum = 0
    @State private var firstNumber = 0
  
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text(String(displayedNumber))
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    
            }
                    
           
            HStack{
                RoundButton(value: "A/C", backgroundColor: Color.gray){
                    displayedNumber = 0
                    
                }
                RoundButton(value: "+/-", backgroundColor: Color.gray){
                    
                }
                RoundButton(value: "%", backgroundColor: Color.gray){
                    
                }
                RoundButton(value: "/", backgroundColor: Color.orange){
                    calculate(choosenOperator: .division)
                    
                }
            }
                HStack{
                    RoundButton(value: "1",backgroundColor: Color.gray){
                       multiplyDigits(number: 1)
                    }
                    RoundButton(value: "2",backgroundColor: Color.gray){
                        multiplyDigits(number: 2)
                    }
                    RoundButton(value:"3",backgroundColor: Color.gray)
                    {
                        multiplyDigits(number: 3)
                    }
                    RoundButton(value: "X", backgroundColor: Color.orange){
                        calculate(choosenOperator: .multiplication)
                        
                    }
                    
                    
                }
                HStack{
                    RoundButton(value:"4",backgroundColor: Color.gray){
                      multiplyDigits(number: 4)
                    }
                    RoundButton(value: "5",backgroundColor: Color.gray){
                        multiplyDigits(number: 5)
                    }
                    RoundButton(value: "6",backgroundColor: Color.gray ){
                        multiplyDigits(number: 6)
                    }
                    RoundButton(value: "-", backgroundColor: Color.orange){
                        calculate(choosenOperator: .subtraction)
                        
                    }
                }
                HStack{
                    RoundButton(value: "7",backgroundColor: Color.gray){
                       multiplyDigits(number: 7)
                    }
                    RoundButton(value: "8", backgroundColor: Color.gray){
                        multiplyDigits(number: 8)
                    }
                    RoundButton(value: "9", backgroundColor: Color.gray){
                       multiplyDigits(number: 9)
                    }
                    RoundButton(value: "+", backgroundColor: Color.orange){
                        //1.save the first number as firstNumber and save the operator as selected operator
                        calculate(choosenOperator: .addition)
                        
                        
                        
                        
                    }
                
               
            }
            
            HStack{
                
                RoundButton(value: "0", backgroundColor: Color.gray){
                    multiplyDigits(number: 0)
                }
                .padding(.horizontal)
            
                RoundButton(value: ",", backgroundColor: Color.gray){
                    
                }
                RoundButton(value: "=", backgroundColor: Color.orange){
                    equalSign(selectedOperator: .equal)
                    
                }
            }
            
            
           
            
        }
        .padding(50)
        .background(Color.black)
           
       
    }
    
    func calculate(choosenOperator: OperatorType){
        selectedOperator = choosenOperator
        firstNumber = displayedNumber
        print("\(firstNumber)  \(selectedOperator) ")
        //inputNumbers = 0
        
        
    }
   
    func equalSign(selectedOperator : OperatorType){
        //when we click the equalSigns for the second time we
        switch selectedOperator {
        case .addition:
            sum = firstNumber + displayedNumber
            print(" printing the sum\(sum)")
            displayedNumber = sum
           
                        
        case .subtraction:
            sum = firstNumber - displayedNumber
            print(" printing the sum\(sum)")
            displayedNumber = sum
        case .multiplication:
            sum = firstNumber * displayedNumber
            print(" printing the sum\(sum)")
            displayedNumber = sum
        case .division:
            sum = firstNumber / displayedNumber
            print(" printing the sum\(sum)")
            displayedNumber = sum
        default: break
            
                    }
        
        
     
  
        

        
    }
    
    func multiplyDigits ( number : Int){
        if displayedNumber == 0{
            displayedNumber = number
            print(displayedNumber)
        } else{
            displayedNumber = displayedNumber * 10 + number
            print(displayedNumber)
        }
        
       
        
    }
        
}

struct RoundButton : View{
    let value : String
    let backgroundColor : Color
    let onTap : () -> Void
    var body: some View{
        Button(value)
            {
                onTap()
            
        }
            .font(.title)
            .padding(20)
            .background(backgroundColor)
            .foregroundColor(Color.white)
            .clipShape(Circle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
