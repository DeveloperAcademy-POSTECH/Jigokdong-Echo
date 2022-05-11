//
//  ContentView.swift
//  MC1
//
//  Created by Kelly Chui on 2022/04/05.
//

import SwiftUI
/*
struct Reply : Codable {
    var id : UUID
    var content :String
    var emoticonName : String
    var date: Date
    var rate : Int
}

func encodeJSON(myId:UUID, myContent:String, myDate:Date, myEmoji:String, myRate:Int) -> Data {
    
    let reply = Reply(id:myId, content:myContent, emoticonName: myEmoji, date: myDate, rate:myRate)
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try encoder.encode(reply)
    return data
}
*/

//struct Reply : Codable {
//    var id : UUID
//    var content :String
//    var emoticonName : String
//    var date: Date
//    var rate : Int
//}

struct DiaryView: View {
    // 내가 쓰는 내용을 실시간으로 보여주려면...
    
    // ************
    //일기 내용을 받아왔을때에 사용할 필드들 (받아온거)
    var yourId: UUID = UUID()
    var yourTitle: String = ""
    var yourContent: String = ""
    var yourDate: Date = Date()
    var yourEmoji: String = ""
    // ************
    
    // ************ (답장할거)
    @State private var showAlert = false
    @State private var saveToggle = false
    @State var myContentPlaceholder: String = "내용 입력"
    @State var myTitlePlaceholder: String = "제목 입력"
    @State var myContent: String = ""
    @State var myTitle: String = ""
    @State var myEmoji: String = "smile"
    var myId: UUID = UUID()
    var myDate: Date = Date()
    var myRate: Int = 0
    // ************
    
    // photo library, camera 접근용
    @State var changeImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    // photo library, camera 접근용
    @State var libraryOrCamera: Bool = true
    //true -> photo library, false -> Camera
    
    
    var body: some View {
        VStack {
            VStack {
                HStack{
                    ZStack {
                             if self.myTitle.isEmpty {
                               TextEditor(text: $myTitlePlaceholder)
                                 .font(.body)
                                 .foregroundColor(.gray)
                                 .disabled(true)
                                 .padding()
                             }
                             TextEditor(text: $myTitle)
                               .font(.body)
                               .opacity(self.myTitle.isEmpty ? 0.25 : 1)
                               .padding()
                    }.frame(minWidth:0, maxWidth: .infinity, maxHeight: 70)
                    Text("2022.04.05")
                    Menu{
                        Button("좋아요", action: {myEmoji = "smile"})
                        Button("그저 그래요", action: {myEmoji = "blank"})
                        Button("슬퍼요", action: {myEmoji = "sad"})
                    } label:{
                        Label {}
                        icon : {
                            Image(myEmoji)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24.0)
                            }
                        }
                }
                .padding(.bottom)
                //Text(yourContent)
                ZStack {
                     if self.myContent.isEmpty {
                       TextEditor(text: $myContentPlaceholder)
                         .font(.body)
                         .foregroundColor(.gray)
                         .disabled(true)
                         .padding()
                     }
                     TextEditor(text: $myContent)
                       .font(.body)
                       .opacity(self.myContent.isEmpty ? 0.25 : 1)
                       .padding()
                }
            }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.brown, lineWidth: 4)
                )
            Toggle("나에게만 저장", isOn: $saveToggle)
//            if saveToggle {
//                //나에게만 저장
//                print("나만")
//            } else {
//                //다른사람에게도 보내기
//                print("다른사람에게")
//            }
            VStack{ // 정보 - 이미지 설정하기
                HStack{ // reply 화살표 - 내 이모지 설정
                    Button(action: {
                        changeImage = true
                        openCameraRoll = true
                        libraryOrCamera = true
                    } ) {
                        Image(systemName: "photo")
                    }
                    Button(action: {
                        changeImage = true
                        openCameraRoll = true
                        libraryOrCamera = false
                    } ) {
                        Image(systemName: "camera.fill")
                    }
                    .sheet(isPresented: $openCameraRoll){
                        if libraryOrCamera{
                            ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                        }
                        else {
                            ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
                        }
                        
                    }
                }
                
                //이미지 첨부 버튼
                HStack{
                    ZStack{
                        Image("NoImage")
                            .ImageMod()
                        if changeImage{
                            Image(uiImage: imageSelected)
                                .ImageMod()
                                
                        } else {
                            Image("NoImage")
                                .ImageMod()
                        }

                    }
                    Spacer()
                }
            }
        }
        .padding(.all)
        .navigationBarTitle("일기 쓰기", displayMode: .inline)
        .toolbar {
            Button("저장") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("저장완료"), message: Text("저장되었습니다"))
            }
        }
        .onTapGesture {

              self.endTextEditing()
        }
    }
}
struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}

extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
