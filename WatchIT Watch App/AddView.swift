//
//  AddView.swift
//  HabitWatch WatchKit Extension
//
//  Created by Alison Gorman on 5/24/22.
//

import SwiftUI


class EmojiPick : ObservableObject {
    @Published var selection = 0
}

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var habits : Habits
    
    @State var name: String = ""
    @State var description: String = ""
    @State var newHabit: Habit = Habit(name: "", description: "", count: 0)
    
    var body: some View {
        List {
            TextField("Habit Name", text: $name)
            
            TextField("Habit Description", text: $description)
            
            Button {
                newHabit = Habit(name: name, description: description, count: 0 )
                habits.add(newHabit)
                dismiss()
            }
            label : {
                HStack{
                    Spacer()
                    Text("Track It!")
                    Spacer()
                }
            }
        }
        .accentColor(Color.cyan)
    }

}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
