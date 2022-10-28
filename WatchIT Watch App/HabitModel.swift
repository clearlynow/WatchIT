//
//  HabitModel.swift
//  WatchIT Watch App
//
//  Created by Alison Gorman on 10/27/22.
//

import SwiftUI

struct Habit : Decodable, Encodable, Identifiable, Equatable {
    var id = UUID()
    var name = ""
    var description = ""
    var count = 0
}

class Habits : ObservableObject {
    @Published var habits : [Habit]
    let saveKey = "SavedHabits"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data ) {
                habits = decoded
                return
            }
        }
        habits = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    
    func add(_ habit: Habit) {
        habits.append(habit)
        save()
    }
}
