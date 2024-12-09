//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Anthony on 30/10/24.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES

  @AppStorage("lineCount") var lineCount: Int = 1
  @State private var value: Float = 1.0

    //MARK: - FUNCTIONS
  func update() {
    lineCount = Int(value) // assign count number from slider
  }

    //MARK: - BODY
    var body: some View {
      VStack(spacing: 8) {

        // HEADER
        HeaderView(title: "Settings")

          // ACTUAL LINE COUNT
        Text("Lines:  \(lineCount)".uppercased())
          .fontWeight(.bold)

          // SLIDER
        Slider(value: Binding( get: {
            self.value
          }, set: {(newValue) in
          if newValue > 0 {
            self.value = newValue
            self.lineCount = Int(value)
          }

          }), in: 0...4, step: 1)
          .tint(.accent)

      } //: VSTACK
      .onAppear {
        value = Float(lineCount)
      }
    }
}

#Preview {
    SettingsView()
}
