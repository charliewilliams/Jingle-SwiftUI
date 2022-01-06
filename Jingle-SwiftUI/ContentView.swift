//
//  ContentView.swift
//  Jingle-SwiftUI
//
//  Created by Charlie Williams on 19/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    var switchIsOn = Binding.constant(true)
    
    let instruments: [Instrument] = {
        InstrumentName.allCases.map { Instrument(name: $0) }
    }()
    
    var body: some View {
        ZStack {
            Color.accentColor
                .edgesIgnoringSafeArea(.all)
            Image("background", bundle: nil)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Jingle+")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text("Shake to make sound.")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.bottom, 75)
                
                HStack(alignment: .center, spacing: 30) {
                    ForEach(instruments) {
                        InstrumentCell(instrument: $0)
                            .frame(width: 250, height: 400, alignment: .center)
                            .border(Color.white, width: 4)
                            .cornerRadius(10)
                            .shadow(radius: 20)
                    }
                }
                .modifier(ScrollingHStackModifier(items: instruments.count, itemWidth: 250, itemSpacing: 30))
            }
            
            VStack(alignment: .leading) {
                Spacer()
                
                Toggle(isOn: switchIsOn) {
                    Text("Keep playing sound when app is backgrounded")
                        .foregroundColor(.white)
                        .font(.footnote)
                }
                .tint(Color.blue)
                .toggleStyle(.switch)
            }
            .fixedSize(horizontal: true, vertical: false)
            
            VStack(alignment: .trailing) {
                
                HStack {
                    Spacer()
                    Button {
                        /// Open info
                        print("hi")
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .tint(.white)
                    }
                }
                Spacer()
            }
            .fixedSize(horizontal: true, vertical: false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
