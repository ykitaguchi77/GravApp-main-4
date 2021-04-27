//
//  DoctorQuestionConfirmPage.swift
//  TestProduct (iOS)
//
//  Created by Kuniaki Ohara on 2021/02/02.
//

import SwiftUI

struct DoctorQuestionConfirmPage: View {
    let q2Option = ["male".localized, "female".localized]
    let q3Option = ["nowsmoking".localized, "prevsmoking".localized, "neversmoking".localized]
    let yesNoOption = ["yes".localized, "no".localized]
    
    @State var q1Answer = ""
    @State var q2Answer = ""
    @State var isSaved = false
    @State var goNext = false

    var body: some View {
        NavigationLink(destination: OutputPage(), isActive: $goNext){
            EmptyView()
        }
        
        VStack{
            Text(ResultHolder.GetInstance().ID)
                .padding()
                .foregroundColor(Color.black)
                .font(.title2)
                .padding()
            
            Divider()
            
            //ScrollView(.vertical){
            TextForm(text:$q1Answer, title:"dq1".localized, placeHolder:  "textfieldplaceholder".localized)   .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                .padding()
                .border(Color.black)
                .font(.title2)
                .padding()
            
            TextForm(text:$q2Answer, title:"dq2".localized, placeHolder:  "textfieldplaceholder".localized)   .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                .padding()
                .border(Color.black)
                .font(.title2)
                .padding()
                
                Spacer()
                
                Button(action:{self.goNext = true}){
                    Text("OK")
                        .foregroundColor(Color.white)
                        .font(Font.title)
                }
                .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 50)
                .background(Color.black)
                .padding(.all)
            //}
        }
        .background(Color.white)
        .navigationTitle("Question Page")
        .onAppear(){
            q1Answer = ResultHolder.GetInstance().DoctorAnswers["q1"] ?? ""
            q2Answer = ResultHolder.GetInstance().DoctorAnswers["q2"] ?? ""
        }
    }
}

struct DoctorQuestionConfirmPage_Previews: PreviewProvider {
    static var previews: some View {
        DoctorQuestionConfirmPage()
    }
}
