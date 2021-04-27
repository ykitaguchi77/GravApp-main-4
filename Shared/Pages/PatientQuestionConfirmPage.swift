//
//  SwiftUIView.swift
//  TestProduct
//
//  Created by Kuniaki Ohara on 2021/01/13.
//

import SwiftUI

struct PatientQuestionConfirmPage: View {
    let q2Option = ["male".localized, "female".localized]
    let q3Option = ["nowsmoking".localized, "prevsmoking".localized, "neversmoking".localized]
    let yesNoOption = ["yes".localized, "no".localized]
    
    @State var q1Answer = ""
    @State var q2Answer = 0
    @State var q3Answer = 0
    @State var q4Answer = ""
    @State var q5Answer = ""
    @State var q6Answer = 0
    @State var q7Answer = 0
    @State var q8Answer = 0
    @State var q9Answer = 0
    @State var q10Answer = 0
    @State var q11Answer = 0
    @State var isSaved = false
    @State var goNext = false

    var body: some View {
        NavigationLink(destination:CameraConfirmPage<DoctorQuestionConfirmPage>(Destination: DoctorQuestionConfirmPage()), isActive: $goNext){
            EmptyView()
        }
        
        VStack{
            ScrollView(.vertical){
                Group{
                    TextForm(text:$q1Answer, title:"pq1".localized, placeHolder:  "textfieldplaceholder".localized)   .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    RadioButton(selectedIndex: $q2Answer, axis: RadioButton.Axis.vertical, title: "pq2".localized, texts: q2Option)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    RadioButton(selectedIndex: $q3Answer, axis: RadioButton.Axis.vertical, title: "pq3".localized, texts: q3Option)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    TextForm(text:$q4Answer, title: "pq4".localized, placeHolder: "textfieldplaceholder".localized)   .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    TextForm(text:$q5Answer, title: "pq5".localized, placeHolder: "textfieldplaceholder".localized)   .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    RadioButton(selectedIndex: $q6Answer, axis: RadioButton.Axis.vertical, title: "pq6".localized, texts: yesNoOption)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    RadioButton(selectedIndex: $q7Answer, axis: RadioButton.Axis.vertical, title: "pq7".localized, texts: yesNoOption)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    RadioButton(selectedIndex: $q8Answer, axis: RadioButton.Axis.vertical, title: "pq8".localized, texts: yesNoOption)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    RadioButton(selectedIndex: $q9Answer, axis: RadioButton.Axis.vertical, title: "pq9".localized, texts: yesNoOption)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                    
                    RadioButton(selectedIndex: $q10Answer, axis: RadioButton.Axis.vertical, title: "pq10".localized, texts: yesNoOption)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                }
                
                Group{
                    RadioButton(selectedIndex: $q11Answer, axis: RadioButton.Axis.vertical, title: "pq11".localized, texts: yesNoOption)
                        .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                        .padding()
                        .border(Color.black)
                        .font(.title2)
                        .padding()
                }
                
                Spacer()
                
                Button(action:{self.goNext = true}){
                    Text("OK")
                        .foregroundColor(Color.white)
                        .font(Font.title)
                }
                .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 50)
                .background(Color.black)
                .padding(.all)
            }
            
        }
        .background(Color.white)
        .navigationTitle("Question Page")
        .onAppear(){
            q1Answer = ResultHolder.GetInstance().PatientAnswers["q1"] ?? ""
            q2Answer = Int(ResultHolder.GetInstance().PatientAnswers["q2"]!) ?? 0
            q3Answer = Int(ResultHolder.GetInstance().PatientAnswers["q3"]!) ?? 0
            q4Answer = ResultHolder.GetInstance().PatientAnswers["q4"] ?? ""
            q5Answer = ResultHolder.GetInstance().PatientAnswers["q5"] ?? ""
            q6Answer = Int(ResultHolder.GetInstance().PatientAnswers["q6"]!) ?? 0
            q7Answer = Int(ResultHolder.GetInstance().PatientAnswers["q7"]!) ?? 0
            q8Answer = Int(ResultHolder.GetInstance().PatientAnswers["q8"]!) ?? 0
            q9Answer = Int(ResultHolder.GetInstance().PatientAnswers["q9"]!) ?? 0
            q10Answer = Int(ResultHolder.GetInstance().PatientAnswers["q10"]!) ?? 0
            q10Answer = Int(ResultHolder.GetInstance().PatientAnswers["q11"]!) ?? 0
        }
    }
}

struct PatientQuestionConfirmPage_Previews: PreviewProvider {
    static var previews: some View {
        PatientQuestionConfirmPage()
    }
}
