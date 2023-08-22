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
    @State private var previousNumber : Int?
   
    
    
    
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
                    handleOperatorTap(tappedOperator: .division)
                    
                }
            }
            HStack{
                RoundButton(value: "1",backgroundColor: Color.gray){
                    handleNumberTap(number: 1)
                }
                RoundButton(value: "2",backgroundColor: Color.gray){
                    handleNumberTap(number: 2)
                }
                RoundButton(value:"3",backgroundColor: Color.gray)
                {
                    handleNumberTap(number: 3)
                }
                RoundButton(value: "X", backgroundColor: Color.orange){
                    handleOperatorTap(tappedOperator: .multiplication)
                    
                }
                
                
            }
            HStack{
                RoundButton(value:"4",backgroundColor: Color.gray){
                    handleNumberTap(number: 4)
                }
                RoundButton(value: "5",backgroundColor: Color.gray){
                    handleNumberTap(number: 5)
                }
                RoundButton(value: "6",backgroundColor: Color.gray ){
                    handleNumberTap(number: 6)
                }
                RoundButton(value: "-", backgroundColor: Color.orange){
                    handleOperatorTap(tappedOperator: .subtraction)
                    
                }
            }
            HStack{
                RoundButton(value: "7",backgroundColor: Color.gray){
                    handleNumberTap(number: 7)
                }
                RoundButton(value: "8", backgroundColor: Color.gray){
                    handleNumberTap(number: 8)
                }
                RoundButton(value: "9", backgroundColor: Color.gray){
                    handleNumberTap(number: 9)
                }
                RoundButton(value: "+", backgroundColor: Color.orange){
                    handleOperatorTap(tappedOperator: .addition)
                    
                    
                    
                    
                }
                
                
            }
            
            HStack{
                
                RoundButton(value: "0", backgroundColor: Color.gray){
                    handleNumberTap(number: 0)
                }
                .padding(.horizontal)
                
                RoundButton(value: ",", backgroundColor: Color.gray){
                    
                }
                RoundButton(value: "=", backgroundColor: Color.orange){
                    handleOperatorTap(tappedOperator: .equal)
                    
                }
            }
            
            
            
            
        }
        .padding(50)
        .background(Color.black)
        
        
    }
    
    /*func calculate(choosenOperator: OperatorType){
     selectedOperator = choosenOperator
     firstNumber = displayedNumber
     print("\(firstNumber)  \(selectedOperator) ")
     displayedNumber = 0
     
     
     }*/
    
    /*func equalSign(selectedOperator : OperatorType, numberToModify : Int){
     //when we click the equalSigns for the second time we
     switch selectedOperator {
     case .addition:
     //first number should be changed into
     sum =   numberToModify + displayedNumber
     print(" printing the sum\(sum)")
     displayedNumber = sum
     
     
     case .subtraction:
     sum =  displayedNumber - numberToModify
     print(" printing the sum\(sum)")
     displayedNumber = sum
     case .multiplication:
     sum =  displayedNumber * numberToModify
     print(" printing the sum\(sum)")
     displayedNumber = sum
     case .division:
     sum = displayedNumber / numberToModify
     print(" printing the sum\(sum)")
     displayedNumber = sum
     default: break
     
     }
     
     
     
     
     
     
     
     }*/
    func handleOperatorTap(tappedOperator : OperatorType){
        if let previousNumber , let selectedOperator {
            switch selectedOperator {
            case .addition:
                displayedNumber = previousNumber + displayedNumber
            case .subtraction:
                displayedNumber = previousNumber - displayedNumber
            case .multiplication:
                displayedNumber = previousNumber * displayedNumber
            case .division:
                displayedNumber = previousNumber / displayedNumber
            case .equal:
                break
            }
            self.previousNumber = nil
            
        } else{
            selectedOperator = tappedOperator
        }
        
        
        
    }
    
    func handleNumberTap (number : Int){
        if let selectedOperator {
            previousNumber = displayedNumber
            displayedNumber = number
        }else{
            multiplyDigits(number: number)
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
