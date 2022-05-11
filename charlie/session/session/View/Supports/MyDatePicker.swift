//
//  DatePicker.swift
//  session
//
//  Created by 김승창 on 2022/04/06.
//

import SwiftUI

struct MyDatePicker: View {
    
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    
    
    var body: some View {
        VStack(spacing: 15) {
            
            let days: [String] =
            ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(getYearMonth()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(getYearMonth()[1])
                        .font(.title.bold())
                }
                
                Spacer()
                //                Spacer(minLength: 0)
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(Color("MyGreen"))
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundColor(Color("MyGreen"))
                    
                }
            }
            .padding(.horizontal)
            
            
            //            달력 요일
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            
            //            달력 날짜
            HStack(spacing: 0) {
                
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    
                    ForEach(extractDate()) { value in
                        
                        DateView(value: value)
                            .background {
                                Capsule()
                                    .fill(isSameDate(date1: value.date, date2: currentDate) ? Color("MyGreen").opacity(0.5) : .white)
                                    .padding(.horizontal, 8)
                                    .opacity(isSameDate(date1: value.date, date2: currentDate) ? 1 : 0)
                            }
                            .onTapGesture {
                                currentDate = value.date
                            }
                        
                    }
                }
            }
        }
        .onChange(of: currentMonth) { newValue in
            currentDate = getCurrentMonth()
        }
        
    }
    
    @ViewBuilder
    func DateView(value: DateValue) -> some View {
        
        VStack {
            if value.day != -1 {
                
                if let diary = myData.first(where: { diary in
                    return isSameDate(date1: diary.date, date2: value.date)
                }) {
                    
                    Text("\(value.day)")
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                    
                    
//                    가장 최근 이모티콘 불러오기
                    getEmoticonImage(emoticonName: diary.emoticonName)
                    
                    
                    
                    
                    
                    
                    Spacer()
                } else {
                    
                    Text("\(value.day)")
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                
                
                
            }
        }
        .padding(.vertical, 4)
        .frame(height: 60, alignment: .top)
    }
    
    
    
    func getYearMonth() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MMMM"
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current
        
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
            
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
        
    }
}


struct MyDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        MyDatePicker(currentDate: .constant(Date()))
    }
}



extension Date {
    
    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
