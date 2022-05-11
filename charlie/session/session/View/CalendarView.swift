import SwiftUI

struct CalendarView: View {
    
    @State private var currentDate = Date()
    
    var body: some View {
        VStack(spacing: 15) {
            
            //                ScrollView 사용 시 List 문제
            
            // 달력 출력
            MyDatePicker(currentDate: $currentDate)
                .padding(.horizontal)
            
            
            Spacer()
            
            
            
            
            
            //                       선택 날짜 일기 출력
            
            let selectedDiaries = myData.filter { isSameDate(date1: $0.date, date2: currentDate) }
            
            if !selectedDiaries.isEmpty {
                
                List {
                    ForEach(selectedDiaries) { diary in
                        
                        NavigationLink(destination: InnerView(diary: diary)) {
                            HStack {
                                Text(diary.title)
                                    .foregroundColor(.primary)
                                    .font(.title3.bold())
                                Spacer()
                                Text(convertDateToString(date: diary.date))
                                    .foregroundColor(.secondary)
                                    .font(.caption)
                                
                                
                                getEmoticonImage(emoticonName: diary.emoticonName)
                                //                                diary.emoticon
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                        .background {
                            Color("MyGreen")
                                .opacity(0.5)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .listRowSeparator(.hidden)
                        // listRowSeparator 위치는 안에!
                    }
                }
                .listStyle(.plain)
                
                
            } else {
                Text("일기가 없습니다.")
                
            }
        }
        .padding()
        
    }
}



func isSameDate(date1: Date, date2: Date) -> Bool {
    let calendar = Calendar.current
    return calendar.isDate(date1, inSameDayAs: date2)
}

func getStringDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM월 dd일"
    return formatter.string(from: date)
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
