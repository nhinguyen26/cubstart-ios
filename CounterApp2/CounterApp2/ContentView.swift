//
//  ContentView.swift
//  CounterApp2
//
//  Created by Nhi Nguyen on 2/14/22.
//

import SwiftUI

struct ContentView: View {
    @State var num = 0
    
    func decrementNum() {
        if num == 0 {
            
        } else {
            num -= 1
        }
    }
    
    var body: some View {
        VStack(spacing:50) {
            Image("oski")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text(String(num))
                .font(.system(size: 50))
            HStack(spacing: 50) {
                Button("Decrement") {
                    decrementNum()
                }
                Button("Increment") {
                    num += 1
            }
                
                
            }
        }
        
    }
}


