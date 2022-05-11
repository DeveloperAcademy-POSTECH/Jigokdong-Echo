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

struct ContentView: View {
    // 내가 쓰는 내용을 실시간으로 보여주려면...
    
    @State var showAlert:Bool = false //발송완료 띄우기
    
    // ************
    //일기 내용을 받아왔을때에 사용할 필드들 (Rain이 받아온거)
    var yourId: UUID = UUID()
    var yourTitle: String = ""
    var yourContent: String = ""
    var yourDate: Date = Date()
    var yourEmoji: String = ""
    // ************
    
    // ************ (답장할거)
    @State var myContent: String = ""
    @State var myEmoji: String = "smile"
    @State var myId: UUID = UUID()
    @State var myDate: Date = Date()
    @State var myRate: Int = 0
    // ************
    
    // photo library, camera 접근용
    @State var changeImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    // photo library, camera 접근용
    @State var libraryOrCamera: Bool = true
    //true -> photo library, false -> Camera
    
    
    var body: some View {
        VStack { // 타인일기 - 내 답장
            VStack { // 제목 - 내용
                HStack{ // 제목 - 날짜 - 이모지
                    //Text(yourTitle)
                    Text("커피")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    //Text(yourDate)
                    Text("2022.04.05")
                        .font(.caption)
                        .fontWeight(.thin)
                    //Image(yourEmoji)
                    Image("sad")
                        .resizable()
                        .foregroundColor(Color.black)
                        .frame(width: 24, height: 24, alignment: .trailing)
                }
                .padding(.bottom)
                //Text(yourContent)
                Text("커피를 좋아하는 나에게 집에서 커피를 핸드드립으로 내려마시는건 중요한 취미이자 생활습관중 하나이다. 실력이 좋지 않은 방구석 커핑이지만 개인적으로 원두마다 맛의 차이도 느끼면서 맛있게 마시고 있다. 포항에서는 친구, 가족들에게 내려 주며 맛 평가도 듣고 같이 마실 수 있어서 좋았는데 포항에 오고 나서는 이 취미를 공유할 사람이 없어서 조금은 아쉬웠다. 혼자 마시는것 보단 같이 마시는게 더 맛있기 때문이다. 포항에서도 빨리 친구가 생겨서 같이 커피를 마시고 싶다. 오늘 아침에 커피를 내리면서 집이 그리워진 이유인것 같다.")
                    .font(.callout)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.brown, lineWidth: 4)
            )
            .navigationBarTitle("답장 쓰기", displayMode: .inline)
            .navigationBarItems(trailing: Button {
                showAlert = true
                let reply = Reply(id:myId, content:myContent, emoticonName: myEmoji, date:myDate, rate:myRate) //struct instance 생성
                encodeJSON(repst: reply) // encoding해서 보내기
            } label: {
                Image(systemName: "paperplane.fill")
            }
                .alert("발송완료", isPresented: $showAlert){
                    Button("알았다") {}
                } message: {
                    Text("발송완료")
                }
            )
            
            // 아래입니다
            VStack{ // 정보 - 이미지 설정하기
                HStack{ // reply 화살표 - 내 이모지 설정
                    Button(action: {
                        changeImage = true
                        openCameraRoll = true
                        libraryOrCamera = true
                    } ) {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    Button(action: {
                        changeImage = true
                        openCameraRoll = true
                        libraryOrCamera = false
                    } ) {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    /*Button(action: {my_bool_Emoji_stats.toggle()}){
                     Image("smile").resizable().frame(width: 24.0, height: 24.0)
                     }
                     */
                    /*
                     if my_bool_Emoji_stats == true {
                     Menu(""){
                     Button("😐", action: {my_bool_Emoji_stats.toggle()})
                     Button("☹️", action: {my_bool_Emoji_stats.toggle()})
                     Button("😢", action: {my_bool_Emoji_stats.toggle()})
                     }
                     }
                     else {
                     }*/
                    Spacer()
                    Menu{
                        Button("Smile_temp", action: {myEmoji = "smile"})
                        Button("Sad_temp", action: {myEmoji = "sad"})
                        //Button("Sad_temp", action: {myEmoji = "sad"})
                        //Button("Sad_temp", action: {myEmoji = "sad"})
                    } label:{
                        Label {}
                        icon : {
                            Image(myEmoji)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        
                    }.sheet(isPresented: $openCameraRoll){
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
                    /*
                    Button(action: {}){
                        Image(systemName: "camera.fill")
                    }
                    */
                    Spacer()
                }
                //state binding boolean 메뉴 state
                //버튼을 누를떄마다 boolean toggle
                ZStack(alignment: .topLeading) { // Placeholder - 내용입력
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                    TextEditor(text: $myContent)
                    if myContent == "" {
                        Text("답장 입력하기")
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
        .padding(.all)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
