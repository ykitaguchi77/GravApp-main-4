//
//  OutputPage.swift
//  TestProduct (iOS)
//
//  Created by Kuniaki Ohara on 2021/02/04.
//

import SwiftUI

struct OutputPage: View {
    
    @State var resultString = ""

    var body: some View {
        GeometryReader { bodyView in
            ZStack{
                Color.white
                    .frame(minWidth:0, maxWidth:CGFloat.infinity, minHeight: 0, maxHeight: CGFloat.infinity)
                
                VStack(){
                    Image(uiImage: ResultHolder.GetInstance().GetUIImages()[0].resize(size: GetPhotoSize(screenSize: bodyView.size))!)
                        .border(Color.black)
                    
                    HStack{
                        Text("youare")
                            .onAppear(){
//                                sendDataset()
//                                getEvaluation()
                            }
                            .font(.title3)
                            .foregroundColor(Color.black)
                        
                        Text(resultString)
                            .font(.title3)
                            .foregroundColor(Color.black)
                    }
                }
                .navigationTitle("OutputPage")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    func getEvaluation(){
        let imageJson = ResultHolder.GetInstance().GetImageJsons()[0]
        let postURL = URL(string: ConstHolder.EVALURL)!
        var request = URLRequest(url: postURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer " + ConstHolder.EVALKEY, forHTTPHeaderField: "Authorization")
        request.httpBody = imageJson.data(using: String.Encoding.utf8)
        URLSession.shared.dataTask(with: request){
            data, _, _ in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            if json == nil {
                print("error in http communicating")
                return
            }
            let jsonCast = json as! [Any]
            let success = jsonCast[0] as! Int
            if success == 0 {
                print("error in handling tensor")
                return
            }
            let result = jsonCast[1] as! String
            resultString = result + "resulttail".localized
        }.resume()
    }
    
    func sendDataset(){
        var errorPointer: NSError?
        let textBlobURL = URL(string: ConstHolder.TEXTCONTAINERURI)
        let textBlobURI = AZSStorageUri(primaryUri: textBlobURL!)
        let textBlobContainer = AZSCloudBlobContainer(storageUri: textBlobURI, error: &errorPointer)
        let textBlob = textBlobContainer.blockBlobReference(fromName: ConstHolder.QUESTIONFILENAME)
        textBlob.upload(fromText: ResultHolder.GetInstance().GetAnswerJson(), completionHandler: { error in
            if (error != nil) {
                print(error!)
            } else{
                print("successfully uploaded text")
            }
        })

        let imageBlobURL = URL(string: ConstHolder.IMAGECONTAINERURI)
        let imageBlobURI = AZSStorageUri(primaryUri: imageBlobURL!)
        let imageBlobContainer = AZSCloudBlobContainer(storageUri: imageBlobURI, error: &errorPointer)
        let images = ResultHolder.GetInstance().GetUIImages()
        for i in 0..<images.count{
            let blob2 = imageBlobContainer.blockBlobReference(fromName: String(i) + ".png")
            blob2.upload(from: images[i].pngData() ?? Data(), completionHandler: { error in
                    if (error != nil) {
                        print(error!)
                    } else{
                        print("successfully uploaded image")
                    }
            })
        }
    }
    
    public func GetPhotoSize(screenSize: CGSize) -> CGSize{
        let shorterSide = (screenSize.width < screenSize.height) ? screenSize.width/2 : screenSize.height/2
        return CGSize(width: shorterSide, height: shorterSide)
    }
}

struct OutputPage_Previews: PreviewProvider {
    static var previews: some View {
        OutputPage()
    }
}
