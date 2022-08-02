//
//  HabitApp.swift
//  Habit
//
//  Created by Guilherme Peppi on 01/08/22.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(ViewModel: SplashViewModel())
        }
    }
}
