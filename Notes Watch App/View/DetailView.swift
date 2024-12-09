//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Anthony on 29/10/24.
//

import SwiftUI

struct DetailView: View {
    //MARK: - PROPERTIES

  let note: Note
  let count: Int
  let index: Int

  @State private var isCreditsPresented: Bool = false
  @State private var isSettingsPresented: Bool = false

    //MARK: - BODY
    var body: some View {
      VStack(alignment: .center, spacing: 3) {
        // HEADER
        HeaderView(title: "")


        // CONTENT
        Spacer()

        ScrollView {
          Text(note.text)
            .font(.title3)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
        }

        Spacer()

        // FOOTER
        HStack(alignment: .center) {
          Image(systemName: "gear")
            .imageScale(.large)
            .onTapGesture {
              isSettingsPresented.toggle()
            }
            .sheet(isPresented: $isSettingsPresented) {
              SettingsView()
            }

          Spacer()

          Text("\(count) / \(index + 1)")

          Spacer()

          Image(systemName: "info.circle")
            .imageScale(.large)
            .onTapGesture {
              isCreditsPresented.toggle()
            }
            .sheet(isPresented: $isCreditsPresented) {
              CreditsView()
            }

        } //: HSTACK
        .foregroundStyle(.secondary)
      } //: VSTACK
      .padding(3)
    }
}

#Preview {

  DetailView(note: sampleData, count: 5, index: 1)
}
