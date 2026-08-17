//
//  MainTabView.swift
//  Encore
//
//  Created by Admin on 15/08/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        TabView {
            Tab("Attended", systemImage: "music.mic"){
                AttendedView()
            }
            Tab("Upcoming", systemImage: "calendar"){
                UpcomingView()
            }
            Tab("Settings", systemImage: "gear"){
                SettingsView()
            }
        }
    }
}


