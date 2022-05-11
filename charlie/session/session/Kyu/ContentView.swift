//
//  ContentView.swift
//  kyu
//
//  Created by Hankyu Lee on 2022/04/05.
//

import SwiftUI

    //질문//
//상대 제목
//rate nil 가능?
//상대 이모티콘
//글자안이쁘게 찍히는거 수정

    //기능//
//답장안왔으면 제출못하게
//답장안오면 신고못하게

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showingAlert = false
    @State private var sendMessage = false
    @State private var showPopUp: Bool = false
    @State private var rating: Int? = 0
    
    
//    @State private var singo : Bool = false
//    var viewModel:ViewModel {
//        ViewModel(letter: myLetterData[1], singo: singo)
//    }
    
    @StateObject var viewModel2: ViewModel2
//    = ViewModel2(letter: letter, singo: false)
    
    var body: some View {
        VStack{
        
            ScrollView{
                VStack{
                    Group{
                    Divider()
                    Spacer().frame(width: 0, height: 15, alignment: .center)
                    HStack{
                        
                        Text(viewModel2.title)
                            .font(.system(size: 18))
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                        Spacer()
                        Text(viewModel2.date)
                            .font(.system(size:13))
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        Text("\(viewModel2.emoticonName)").font(.system(size:13))
                           
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                    }
                    Spacer().frame(width: 0, height: 8, alignment: .center)
                        Text("\(viewModel2.content)").padding()
                }
                    Group{
                    Divider()
                    HStack{
                        Image(systemName: "arrowshape.turn.up.left.fill")
                            .font(.system(.largeTitle))
                            .rotationEffect(.degrees(180)).padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))

                        Spacer()
                        Text("\(viewModel2.repliedDate)")
                            .font(.system(size:13))
                        
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            
                        Text("\(viewModel2.repliedEmoticonName)").font(.system(size:13))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                    }
                        
                    Text(viewModel2.repliedContent)
                    .padding()
                        .font(.system(.body))
                        .opacity(1)
                    Divider()
                }
                    HStack{
                    Text("👍 이 답장에 대한 나의 만족도를 입력하세요.")
                        .font(.system(size: 13))
                        Spacer()
                    }.padding(EdgeInsets(top: 4, leading: 4, bottom: 16, trailing: 4))
              
                    RatingView(rating: $rating, max: 5)
                }
            }
            .navigationTitle(Text("답장 보기")).navigationBarTitleDisplayMode(.inline)
                    .toolbar(content: {
                                    ToolbarItem(placement: .navigationBarTrailing) {
                                        HStack {
                                            Button(action: {
                                                sendMessage = true
                                          
                                            
                                                
                                            }, label: {Image(systemName: "checkmark")
                                                    .opacity(viewModel2.isItreplied ? 1:0)
                                                
                                            })
                                                .alert(isPresented: $sendMessage, content: {
                                                    Alert(title: Text("정하셨나요?"), message: Text("네?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Yes")
                                                                                                                                                                                                                                                         , action: {
                                                        sendMessage = false
                                                        viewModel2.letter.reply?.rate = rating
                                                        self.presentationMode.wrappedValue.dismiss()
//                                                        NavigationLink(destination: ListVIew(isEditing: .constant(false), showSearchBar: .constant(.false
//                                                                                                                                                  )), label: <#T##() -> _#>)
                                                        
        
                                                    })
                                                    )
                                                })

                                        }
                                    }
                                })
        
            
            
            HStack{
                Button(action: {
                    print("alert view")
                    self.showingAlert = true
                }, label: {
                    Text(viewModel2.singoMent).font(.system(size: 11))
                }).padding()
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text("\(viewModel2.singoQuestionMent)"), message: Text("네?"), primaryButton: .cancel(),
                              secondaryButton: .destructive(Text("Yes")
                                                                                                                                                                                                                    , action: {
                            
                            viewModel2.singo.toggle()
          
                        })
                        )
                    })
                Spacer()
                Text(" 신고되었습니다.").padding(.trailing)
                    .opacity(viewModel2.singo == true ? 1 : 0)
            }
        }
        
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

