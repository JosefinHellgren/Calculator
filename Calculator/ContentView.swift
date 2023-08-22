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

enum Numbers {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var digit : Int{
        switch self {
        case .zero:
            return 0
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        }
    }
}

struct ContentView: View {
    @State private var displayedNumber = 0
    @State private var tappedNumber : Numbers?
    @State private var selectedOperator : OperatorType?
    @State private var previousNumber : Int?
    @State private var operatorActive = false
   
    
    
    
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
                        previousNumber = nil
                        
                        
                    }
                    RoundButton(value: "+/-", backgroundColor: Color.gray){
                        
                    }
                    RoundButton(value: "%", backgroundColor: Color.gray){
                        
                    }
                    RoundButton(value: "/", backgroundColor:  Color.orange ){
                        handleOperatorTap(tappedOperator: .division)
                        
                        
                    }
                }
                HStack{
                    RoundButton(value: "1",backgroundColor: Color.gray){
                        handleNumberTap(number: .one)
                    }
                    RoundButton(value: "2",backgroundColor: Color.gray){
                        handleNumberTap(number: .two)
                    }
                    RoundButton(value:"3",backgroundColor: Color.gray)
                    {
                        handleNumberTap(number: .three)
                    }
                    RoundButton(value: "X", backgroundColor: Color.orange ){
                        handleOperatorTap(tappedOperator: .multiplication)
                        
                        
                    }
                    
                    
                }
                HStack{
                    RoundButton(value:"4",backgroundColor: Color.gray){
                        handleNumberTap(number: .four)
                    }
                    RoundButton(value: "5",backgroundColor: Color.gray){
                        handleNumberTap(number: .five)
                    }
                    RoundButton(value: "6",backgroundColor: Color.gray ){
                        handleNumberTap(number: .six)
                    }
                    RoundButton(value: "-",backgroundColor: Color.orange ){
                        handleOperatorTap(tappedOperator: .subtraction)
                        
                        
                    }
                }
                HStack{
                    RoundButton(value: "7",backgroundColor: Color.gray){
                        handleNumberTap(number: .seven)
                    }
                    RoundButton(value: "8", backgroundColor: Color.gray){
                        handleNumberTap(number: .eight)
                    }
                    RoundButton(value: "9", backgroundColor: Color.gray){
                        handleNumberTap(number: .nine)
                    }
                    RoundButton(value: "+", backgroundColor: Color.orange ){
                        handleOperatorTap(tappedOperator: .addition)
                        
                    }
                    
                    
                }
                
                HStack{
                    
                    RoundButton(value: "0", backgroundColor: Color.gray){
                        handleNumberTap(number: .zero)
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
    
    func handleNumberTap (number : Numbers){
        if let selectedOperator {
           
            previousNumber = displayedNumber
            displayedNumber = number.digit
            //när vi checkat ifalll vi har en selectedOperator en gång, och därför satt previousNumber så borde vi kunna trycka på en siffra tills vi trycker på en operatorknapp.
            //här sätter vi ju previousNumber till displayNumber varje gång vi klickar på ett nummer så det blir bara nya siffror hela tiden. och därmer nya tal.
            //self.selectedOperator = nil
            //om
          
            
            print("previous number in handletapnumber\(previousNumber)")
            print("displayed number in handletapnumber\(displayedNumber)")
           
        }else{
            multiplyDigits(number: number.digit)
        
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
