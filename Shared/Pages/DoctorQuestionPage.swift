//
//  DoctorQuestionPage.swift
//  TestProduct (iOS)
//
//  Created by Kuniaki Ohara on 2021/02/02.
//

import SwiftUI

struct DoctorQuestionPage: View {
    
    @State var q1Answer = ""
    @State var q2Answer = ""
    @State var isSaved = false
    @State var goNext = false
    @Binding var rootActive: Bool

    var body: some View {
        NavigationLink(destination: PatientQuestionPage(rootActive: self.$rootActive), isActive: $goNext){
            EmptyView()
        }
        
        VStack{
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
            
            Button(action:{
                ResultHolder.GetInstance().SetDoctorAnswer(q1: q1Answer, q2: q2Answer)
                self.isSaved = true
            }){
                Text("save".localized)
                    .foregroundColor(Color.white)
                    .font(Font.title)
            }
            .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 50)
            .background(Color.black)
            .padding([.top, .leading, .trailing])
            .alert(isPresented: $isSaved, content: {
                Alert(title: Text("saved".localized))
            })
                
            Button(action:{
                self.goNext = true
            }){
                Text("gopatientquestion".localized)
                    .foregroundColor(Color.white)
                    .font(Font.title)
            }
            .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 50)
            .background(Color.black)
            .padding(.all)
        }
        .background(Color.white)
        .navigationTitle("Question Page")
        .onAppear(){
            q1Answer = ResultHolder.GetInstance().DoctorAnswers["q1"] ?? ""
            q2Answer = ResultHolder.GetInstance().DoctorAnswers["q2"] ?? ""
        }
    }
}

//struct DoctorQuestionPage_Previews: PreviewProvider {
//    static var previews: some View {
//        DoctorQuestionPage()
//    }
//}
