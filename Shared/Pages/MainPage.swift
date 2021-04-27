//
//  ContentView.swift
//  Shared
//
//  Created by Kuniaki Ohara on 2021/01/06.
//

import SwiftUI

struct MainPage: View {
    
    @State var goTakePhoto = false
    @State var isPatientQuestion = false
    @State var isDoctorQuestion = false
    @State var goConfirm = false
    @Binding var rootActive: Bool
    
    var body: some View {
        NavigationLink(destination: CameraPage(rootActive: self.$rootActive), isActive: $goTakePhoto){
            EmptyView()
        }
        NavigationLink(destination: PatientQuestionPage(rootActive: self.$rootActive), isActive: $isPatientQuestion){
            EmptyView()
        }
        NavigationLink(destination: DoctorQuestionPage(rootActive: self.$rootActive), isActive: $isDoctorQuestion){
            EmptyView()
        }
        NavigationLink(destination: PatientQuestionConfirmPage(), isActive: $goConfirm){
            EmptyView()
        }
        
        ZStack{
            // Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Button(action:{
                            goTakePhoto = true
                        }){
                    Text("camerapage".localized)
                        .foregroundColor(Color.white)
                        .font(Font.largeTitle)
                }
                .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                .background(Color.black)
                .padding()
                
                Button(action:{
                    isPatientQuestion = true
                        }){
                    Text("patientquestionpage".localized)
                        .foregroundColor(Color.white)
                        .font(Font.largeTitle)
                }
                    .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                    .background(Color.black)
                    .padding()
                
                Button(action:{
                    isDoctorQuestion = true
                        }){
                    Text("doctorquestionpage".localized)
                        .foregroundColor(Color.white)
                        .font(Font.largeTitle)
                }
                    .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                    .background(Color.black)
                    .padding()
                
                Spacer()
                
                Button(action:{
                    self.goConfirm = true
                }){
                    Text("confirmpage".localized)
                        .foregroundColor(Color.white)
                        .font(Font.largeTitle)
                }
                    .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                    .background(Color.black)
                    .padding()
                
                Button(action:{
                    self.rootActive = false
                }){
                    Text("backtotop".localized)
                        .foregroundColor(Color.white)
                        .font(Font.largeTitle)
                }
                    .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 100)
                    .background(Color.black)
                    .padding()
            }
        }
        .navigationTitle("Main Page")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // MainPage()
        }
    }
}
