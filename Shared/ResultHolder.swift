//
//  ResultHolder.swift
//  TestProduct
//
//  Created by Kuniaki Ohara on 2021/01/30.
//

import SwiftUI

class ResultHolder{
    init() {}
    
    // インスタンスを保持する必要はなく、すべてのインスタンス変数をstaticにする実装で良いと思います。
    static var instance: ResultHolder?
    public static func GetInstance() -> ResultHolder{
        if (instance == nil) {
            instance = ResultHolder()
        }
        
        return instance!
    }
    
    private (set) public var ID = ""
    public func SetID(id: String) -> Bool{
        let isValid = id != ""
        
        if (isValid){
            ID = id
        }
        else{
            print("invalid id!!!")
        }
        
        return isValid
    }
    
    private (set) public var Images: [Int:CGImage] = [:]
    public func GetUIImages() -> [UIImage]{
        var uiImages: [UIImage] = []
        let length = Images.count
        for i in 0 ..< length {
            if (Images[i] != nil){
                uiImages.append(UIImage(cgImage: Images[i]!.cropToSquare()))
            }
        }
        
        return uiImages
    }
    
    public func SetImage(index: Int, cgImage: CGImage){
        Images[index] = cgImage
    }
    public func GetImageJsons() -> [String]{
        var imageJsons:[String] = []
        let uiimages = GetUIImages()
        let jsonEncoder = JSONEncoder()
        let length = uiimages.count
        for i in 0 ..< length {
            if (Images[i] != nil){
                let data = PatientImageData()
                
                data.image = uiimages[i].resize(size: ConstHolder.EVALIMAGESIZE)!.pngData()!.base64EncodedString()
                let jsonData = (try? jsonEncoder.encode(data)) ?? Data()
                let json = String(data: jsonData, encoding: String.Encoding.utf8)!
                imageJsons.append(json)
            }
        }
        
        return imageJsons
    }
    
    private (set) public var DoctorAnswers: [String:String] = ["q1":"", "q2":""]
    private (set) public var PatientAnswers: [String:String] = ["q1":"",  "q2":"", "q3":"", "q4":"", "q5":"", "q6":"", "q7":"", "q8":"", "q9":"", "q10":"", "q11":""]
    public func SetDoctorAnswer(q1:String, q2:String){
        DoctorAnswers["q1"] = q1
        DoctorAnswers["q2"] = q2
    }
    public func SetPatientAnswer(q1:String, q2:String, q3:String, q4:String, q5:String, q6:String, q7:String, q8:String, q9:String, q10:String, q11:String){
        PatientAnswers["q1"] = q1
        PatientAnswers["q2"] = q2
        PatientAnswers["q3"] = q3
        PatientAnswers["q4"] = q4
        PatientAnswers["q5"] = q5
        PatientAnswers["q6"] = q6
        PatientAnswers["q7"] = q7
        PatientAnswers["q8"] = q8
        PatientAnswers["q9"] = q9
        PatientAnswers["q10"] = q10
        PatientAnswers["q11"] = q11
    }
    public func GetAnswerJson() -> String{
        let data = QuestionAnswerData()
        data.pq1 = PatientAnswers["q1"] ?? ""
        data.pq2 = PatientAnswers["q2"] ?? ""
        data.pq3 = PatientAnswers["q3"] ?? ""
        data.pq4 = PatientAnswers["q4"] ?? ""
        data.pq5 = PatientAnswers["q5"] ?? ""
        data.pq6 = PatientAnswers["q6"] ?? ""
        data.pq7 = PatientAnswers["q7"] ?? ""
        data.pq8 = PatientAnswers["q8"] ?? ""
        data.pq9 = PatientAnswers["q9"] ?? ""
        data.pq10 = PatientAnswers["q10"] ?? ""
        data.pq10 = PatientAnswers["q11"] ?? ""
        data.dq1 = DoctorAnswers["q1"] ?? ""
        data.dq2 = DoctorAnswers["q2"] ?? ""
        let jsonEncoder = JSONEncoder()
        let jsonData = (try? jsonEncoder.encode(data)) ?? Data()
        let json = String(data: jsonData, encoding: String.Encoding.utf8)!
        return json
    }
}

class PatientImageData: Codable{
    var image = ""
}

class QuestionAnswerData: Codable{
    var pq1 = ""
    var pq2 = ""
    var pq3 = ""
    var pq4 = ""
    var pq5 = ""
    var pq6 = ""
    var pq7 = ""
    var pq8 = ""
    var pq9 = ""
    var pq10 = ""
    var dq1 = ""
    var dq2 = ""
}
