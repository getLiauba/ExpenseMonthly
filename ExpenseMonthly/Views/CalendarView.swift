//
//  CalendarView.swift
//  ExpenseMonthly
//
//  Created by andrew liauba on 2023-03-21.
//

import SwiftUI

private extension TimeInterval {
    var days: Int {
        return Int(self / (60 * 60 * 24))
    }
}

struct CalendarView: View {
    private let calendar = Calendar.current
    @State private var selectedDate: Date = Date()
    
    let gradient = LinearGradient(gradient: Gradient(colors: [.purple,.pink]), startPoint: .topTrailing, endPoint: .bottomLeading)

    private func getDaysOfMonth() -> [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: selectedDate) else {
            return []
        }
        return (0..<monthInterval.duration.days).compactMap {
            calendar.date(byAdding: .day, value: $0, to: monthInterval.start)
        }
    }

    var body: some View {
        ZStack {
            VStack {
                // Month and year selection controls
                HStack {
                    Button(action: {
                        selectedDate = calendar.date(byAdding: .month, value: -1, to: selectedDate)!
                    }) {
                        Image(systemName: "arrowtriangle.left.fill")
                            .font(.title)
                            .foregroundColor(.purple)
                    }
                    Spacer()
                    Text(calendar.monthSymbols[calendar.component(.month, from: selectedDate) - 1])
                        .font(.title)
                    Spacer()
                    Button(action: {
                        selectedDate = calendar.date(byAdding: .month, value: 1, to: selectedDate)!
                    }) {
                        Image(systemName: "arrowtriangle.right.fill")
                            .font(.title)
                            .foregroundColor(.purple)
                    }
                }
                .padding(.horizontal)

                // Year display
                Text(DateFormatter.year.string(from: selectedDate))
                    .font(.headline)

                // Grid view - display the days of the month
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                    ForEach(getDaysOfMonth(), id: \.self) { day in
                        Button(action: { selectedDate = day }) {
                            Text("\(calendar.component(.day, from: day))")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(isSelectedDay(day) ? .white : .primary)
                                .background(isSelectedDay(day) ? Color.purple : Color.clear)
                                .clipShape(Circle())
                                .padding(.vertical)
                        }
                        .disabled(!isDayOfMonth(day))
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }

    // Helper function to determine if a date is within the current month
    private func isDayOfMonth(_ day: Date) -> Bool {
        calendar.component(.month, from: day) == calendar.component(.month, from: selectedDate)
    }

    // Helper function to determine if a date is the currently selected date
    private func isSelectedDay(_ day: Date) -> Bool {
        calendar.isDate(day, equalTo: selectedDate, toGranularity: .day)
    }
}

extension DateFormatter {
    static let year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
