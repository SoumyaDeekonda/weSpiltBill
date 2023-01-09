//
//  ContentView.swift
//  WeSplit
//
//  Created by Soumya Deekonda on 10/31/22.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount = 0.0
    @State var numberOfPeople = 2
    @State var tipPercentage = 10
    
    //  @FocusState private var amountIsFocused: Bool
    
    var currencyFormat = FloatingPointFormatStyle<Double>.Currency.self(code: Locale.current.currencyCode ?? "USD")
    
    let tipPercentages = [10, 20, 30, 40, 0]
    
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal =  checkAmount + tipValue
        let amountPerperson = grandTotal / peopleCount
        return amountPerperson
    }
    var body: some View {
        
        NavigationView{
            Form {
                Section {
                    
                    //  TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    //(or) use code below
                    TextField("Amount", value: $checkAmount, format: currencyFormat)
                        .keyboardType(.decimalPad)
                    //.focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        //  ForEach(tipPercentages, id:\.self) {
                        // (or) below code
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    //(or) if you dont use the above code use the below code
                    //.pickerStyle(.segmented)
                } header: {
                    Text("How much tip you want to leave?")
                }
                
                Section {
                    //Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    Text(totalPerPerson, format: currencyFormat)
                    
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationBarTitle("WeSplit")
            //.toolbar {
            //  ToolbarItemGroup(placement: .keyboard) {
            
            // Button("Done") {
            // amountIsFocused = false
            //}
            // }
            //}
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
