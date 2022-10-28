//
//  ContentView.swift
//  WatchIT Watch App
//
//  Created by Alison Gorman on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
        
    var body: some View {
 
        NavigationStack{
                List {
                    ForEach($habits.habits) { $habit in
                        NavigationLink(destination: TrackView(habit: $habit)) {
                            HStack {
                                Spacer()
                                Text(habit.name)
                                //Text(habit.description)
                                Spacer()
                                Text(String(habit.count)).bold().font(.largeTitle).foregroundStyle(Color.blue)
                                
                            }
                            .padding()
                            .onChange(of: habit) { _ in
                                habits.save()
                            }
                        }
                    }
                    .onDelete(perform: removeHabit)
                    
                    NavigationLink(destination: AddView().environmentObject(habits)) {
                        HStack{
                            Spacer()
                            Text("Add New").foregroundColor(.accentColor)
                            Spacer()
                        }
                    }
                }
                .navigationTitle("Watch It 👀")
            }
            .accentColor(Color.cyan)
        }
    
    
    func removeHabit(at offsets: IndexSet) {
        habits.habits.remove(atOffsets: offsets)
        habits.save()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
