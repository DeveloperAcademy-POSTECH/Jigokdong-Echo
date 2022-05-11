//
//  ContentView.swift
//  MC1
//
//  Created by Kelly Chui on 2022/04/05.
//


import SwiftUI

extension Color {
    public static var customGreen: Color {
        return Color(UIColor(red: 139/255, green: 167/255, blue: 132/255, alpha: 1.0))
    }
}

extension Color {
    public static var customBase: Color {
        return Color(UIColor(red: 244/255, green: 233/255, blue: 200/255, alpha: 1.0))
    }
}

struct ReplyView: View {
    var letters: Letter
    // 내가 쓰는 내용을 실시간으로 보여주려면...
    @State var showAlert:Bool = false //발송완료 띄우기
    /*
    // ************
    //일기 내용을 받아왔을때에 사용할 필드들 (Rain이 받아온거)
    var yourId: UUID = letters.id
    var yourTitle: String = letters.title
    var yourContent: String = letters.content
    var yourDate: Date = letters.date
    var yourEmoji: String = letters.emoticonName
    // ************
    */
    
    // ************ (답장할거)
    @State var myContent: String = ""
    @State var myContentPlaceholder: String = "답장 입력하기"
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
    @State var backback: Bool = false
    
    var mp_optional : MyReply? = nil
    
    var body: some View {
        /*
        NavigationLink(destination: MailboxView(),
                                       isActive: self.$backback)
        { EmptyView() }
        */
        VStack { // 타인일기 - 내 답장
            VStack { // 제목 - 내용
                HStack{ // 제목 - 날짜 - 이모지
                    //Text(yourTitle)
                    Text(letters.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    //Text(letters.date)
                    Text(convertDateToString(date: letters.date))
                        .font(.caption)
                        .fontWeight(.thin)
                    //Image(yourEmoji)
                    Image(letters.emoticonName)
                        .resizable()
                        .foregroundColor(Color.black)
                        .frame(width: 24, height: 24, alignment: .trailing)
                }
                .padding([.leading, .bottom, .trailing])
                //Text(yourContent)
                Text(letters.content)
                    .font(.callout)
                    .padding(.all)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.customGreen))
            }
            .navigationBarTitle("답장 쓰기", displayMode: .inline)
            .navigationBarItems(trailing: Button {
                showAlert = true
                
                // JSON struct 생성
                let mp = MyReply(id:myId,
                                 date:myDate,
                                 content:myContent,
                                 emoticonName: myEmoji) //struct instance 생성
                //self.mp_optional = mp
                let lt = Letter(id:letters.id,
                                title:letters.title,
                                date:letters.date,
                                content:letters.content,
                                emoticonName: letters.emoticonName,
                                reply: mp
                                )
                // JSON struct 생성
                encodeJSON(repst: lt) // encoding해서 보내기
                
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.customGreen)
            }
                .alert("발송 완료", isPresented: $showAlert){
                    Button("확인") {
                        //backback = true
                        let _ = navigationBarHidden(true)
                    }
                } message: {
                    Text("답장을 작성하셨습니다.")
                }
            )
            
            // 아래입니다
            VStack{ // 정보 - 이미지 설정하기
                HStack{ // 포토 라이브러리 - 카메라 - 내 이모지 설정
                    Button(action: {
                        changeImage = true
                        openCameraRoll = true
                        libraryOrCamera = true
                    } ) {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.customGreen)
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
                            .foregroundColor(.customGreen)
                    }
                    Spacer()
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
                .padding(.horizontal)
                
                //이미지 미리보기
                VStack{
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
                        .padding([.top, .leading])
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
                        //TextEditor(text: $myContent)
                        if self.myContent.isEmpty {
                          TextEditor(text: $myContentPlaceholder)
                            .font(.body)
                            .foregroundColor(.gray)
                            .disabled(true)
                            .padding()
                        }
                        TextEditor(text: $myContent)
                          .font(.body)
                          .padding()
                          .colorMultiply(.customBase)
                    }
                }.background(RoundedRectangle(cornerRadius: 20).fill(Color.customBase))
                /*
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
                    //TextEditor(text: $myContent)
                    if self.myContent.isEmpty {
                      TextEditor(text: $myContentPlaceholder)
                        .font(.body)
                        .foregroundColor(.gray)
                        .disabled(true)
                        .padding()
                    }
                    TextEditor(text: $myContent)
                      .font(.body)
                      .padding()
                }
                */
            }
        }
        .padding(.all)
    }
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(letters: myLetterData[9])
    }
}
 */

