//
//  HabitView.swift
//  HabitWatch WatchKit Extension
//
//  Created by Alison Gorman on 5/24/22.
//

import SwiftUI



struct TrackView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var habit: Habit
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                Text(habit.name)
                Text(habit.description)
                
                
                Text(String(habit.count)).font(.largeTitle).bold()
                    .foregroundStyle(Color.blue)
                    .frame(width: 50)
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                
                Button {
                    habit.count += 1
                    dismiss()
                }
                label: {
                    Image(systemName: "checkmark.circle").font(.largeTitle).foregroundColor(.accentColor)
                    }
                
                Button {
                    habit.count = 0
                }
                label: {
                    Text("Clear").foregroundColor(.accentColor)
                    }
                
            }
            .accentColor(Color.cyan)
        }
        
    }
}

