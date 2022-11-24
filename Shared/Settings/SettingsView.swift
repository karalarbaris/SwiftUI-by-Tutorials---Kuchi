//
//  SettingsView.swift
//  Kuchi
//
//  Created by Baris Karalar on 24.11.22.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("numberOfQuestions") var numberOfQuestions = 6
    @AppStorage("appearance") var appearance: Appearance = .automatic
    @State private var learningEnabled: Bool = true
    @AppStorage("dailyReminderEnabled") var dailyReminderEnabled = false
    @State private var dailyReminderTime = Date(timeIntervalSince1970: 0)
    @AppStorage("dailyReminderTime") var dailyReminderTimeShadow: Double = 0
    @State private var cardBackgroundColor: Color = .red
    
    
    var body: some View {
        List {
            Text("Settings")
                .font(.largeTitle)
                .padding(.bottom, 8)
            
            Section {
                
                VStack(alignment: .leading) {
                    
                    Picker("", selection: $appearance) {
                        ForEach(Appearance.allCases) { appearance in
                            Text(appearance.name).tag(appearance)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    ColorPicker("Card Background Color", selection: $cardBackgroundColor)
                }
                
                
            } header: {
                Text("Appearance")
            }
            
            Section {
                
                VStack(alignment: .leading) {
                    Stepper("Number of Questions: \(numberOfQuestions)",
                            value: $numberOfQuestions,
                            in: 3...20)
                    
                    Text("Any change will affect the next game")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Toggle("Learning enabled", isOn: $learningEnabled)
                
                
                
            } header: {
                Text("Game")
            }
            
            Section {
                HStack {
                    Toggle("Daily Reminder", isOn: $dailyReminderEnabled)
                        
                    DatePicker("", selection: $dailyReminderTime, displayedComponents: .hourAndMinute)
                        .disabled(dailyReminderEnabled == false)
                    
                }
            } header: {
                Text("Notifications")
            }
            .onChange(of: dailyReminderEnabled) { _ in
                configureNotification()
            }
            .onChange(of: dailyReminderTime) { newValue in
                dailyReminderTimeShadow = newValue.timeIntervalSince1970
                configureNotification()
            }
            .onAppear {
                    dailyReminderTime = Date(timeIntervalSince1970: dailyReminderTimeShadow)
            }
            
        }
        
    }
    
    func configureNotification() {
        if dailyReminderEnabled {
            LocalNotifications.shared.createReminder(time: dailyReminderTime)
        } else {
            LocalNotifications.shared.deleteReminder()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
