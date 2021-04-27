//
//  ContentView.swift
//  Shared
//
//  Created by Kuniaki Ohara on 2021/01/06.
//

import SwiftUI

struct IDPage: View {
    
    @State var id = "A"
    @State var isLogin = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("患者ID")
                        .foregroundColor(Color.black)
                        .font(Font.largeTitle)
                        .padding([.top, .leading, .trailing])
                    
                    TextField("", text: $id)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        //これではだめ
//                        .border(Color.black)
//                        .cornerRadius(10)
                        .font(Font.largeTitle)
                        .foregroundColor(Color.black)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                        .background(Color.white)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                }
                
                VStack{
                    
                    Spacer()
                    
                    Button(action:self.login){
                        Text("idbutton")
                            .foregroundColor(Color.white)
                            .font(Font.title)
                    }
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .background(Color.black)
                        .padding()
                }
            }
            .navigationBarHidden(true)
            .navigationTitle("ID Page")
            .background(Color.white)
            .background(NavigationLink(destination:ConsensusPage(rootActive: self.$isLogin), isActive: $isLogin){
                EmptyView()
            }.isDetailLink(false))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func login(){
        isLogin = ResultHolder.GetInstance().SetID(id: self.id)
    }
}

struct ID_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IDPage()
        }
    }
}
