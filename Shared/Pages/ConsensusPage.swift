//
//  ContentView.swift
//  Shared
//
//  Created by Kuniaki Ohara on 2021/01/06.
//

import SwiftUI

struct ConsensusPage: View {
    
    @State var isOK = false
    @Binding var rootActive: Bool
    
    var body: some View {
        VStack{
            ScrollView(.vertical){
                Text("consensus")
                    .foregroundColor(.black)
            }
            .padding()
            
            Spacer()
            
            Button(action:self.login){
                Text("consensusbutton")
                    .foregroundColor(Color.white)
                    .font(Font.title)
            }
                .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 50)
                .background(Color.black)
                .padding([.bottom, .horizontal])
        }
        .navigationTitle("Consensus Page")
        .background(Color.white)
        .background(NavigationLink(destination:MainPage(rootActive: self.$rootActive), isActive: $isOK){
            EmptyView()
        })
    }
    
    func login(){
        isOK = true
    }
}

struct ConsensusPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // ConsensusPage()
        }
    }
}
